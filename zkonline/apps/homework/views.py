from django.shortcuts import render, HttpResponse
from django.views.generic.base import View
from pure_pagination import Paginator, PageNotAnInteger
from django.contrib.auth.mixins import LoginRequiredMixin  # 让页面需要登陆才能看到
from django.db.models import Q
import datetime
from django.utils import timezone

from apps.homework.models import Homework, HomeworkTask
from apps.homework.forms import HomeworkForm, HomeworkTaskForm
from apps.courses.models import Course, CourseResource


class HomeworkSubmitView(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(self, request, task_id, *args, **kwargs):
        homework_form = HomeworkForm()
        task = HomeworkTask.objects.get(id=int(task_id))
        homework = Homework.objects.filter(user=request.user, task=task)
        if homework:
            homework = Homework.objects.get(user=request.user, task=task)
        return render(request, "homework_submit.html", {
            "homework_form": homework_form,
            "task": task,
            "homework": homework,
        })

    def post(self, request, task_id, *args, **kwargs):
        homeworkForm = HomeworkForm(request.POST)
        task = HomeworkTask.objects.get(id=int(task_id))
        is_outdate = self.date_compare(str(task.deadline), str(timezone.now))
        homework = Homework.objects.filter(user=request.user, task=task)
        if homework:
            homework = Homework.objects.get(user=request.user, task=task)
            if homework.score != -1:
                return render(request, "homework_submit.html", {
                    "homework_form": homeworkForm,
                    "msg": "已超出可提交时间",
                    "task": task,
                    "homework": homework,
                })

        if is_outdate:
            return render(request, "homework_submit.html", {
                "homework_form": homeworkForm,
                "msg": "已超出可提交时间",
                "task": task,
                "homework": homework,
            })
        else:
            if homeworkForm.is_valid():
                user = request.user
                content = homeworkForm.cleaned_data['content']
                title = homeworkForm.cleaned_data['title']
                homework = Homework.objects.filter(user=request.user, task=task)
                if not homework:
                    new_homework = Homework()
                    new_homework.user = user
                    new_homework.task = task
                    new_homework.title = title
                    new_homework.content = content
                    new_homework.teacher = task.teacher
                    new_homework.save()
                    task.homework_num += 1
                    task.save()
                else:
                    homework = Homework.objects.get(user=request.user, task=task)
                    homework.title = title
                    homework.content = content
                    homework.save()
                return render(request, "homework_submit.html", {
                    "homework_form": homeworkForm,
                    "msg": "上传成功",
                    "task": task,
                    "homework": homework,
                })

        return render(request, "homework_submit.html", {
            "homework_form": homeworkForm,
            "msg": "上传失败",
            "task": task,
            "homework": homework,
        })

    def date_compare(date1, date2, fmt='%Y-%m-%d') -> bool:  # date2是否大于date1
        zero = datetime.datetime.fromtimestamp(0)

        try:
            d1 = datetime.datetime.strptime(date1, fmt)
        except:
            d1 = zero

        try:
            d2 = datetime.datetime.strptime(date2, fmt)
        except:
            d2 = zero
        return d1 < d2


class HomeworkListView(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(self, request, course_id, *args, **kwargs):
        course = Course.objects.get(id=int(course_id))
        course_resources = CourseResource.objects.filter(course=course)
        task_num = course.homeworktask_set.all().count()
        tasks = course.homeworktask_set.all().order_by("-c_time")

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(tasks, per_page=10, request=request)
        tasks = p.page(page)

        return render(request, "homework_list.html", {
            "course": course,
            "course_resources": course_resources,
            "tasks": tasks,
            "task_num": task_num,
        })
