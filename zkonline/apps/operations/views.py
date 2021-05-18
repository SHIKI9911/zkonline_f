from django.shortcuts import render, HttpResponse
from django.views.generic.base import View
from django.http import JsonResponse
from django.db.models import Q
from pure_pagination import Paginator, PageNotAnInteger
from django.contrib.auth.mixins import LoginRequiredMixin

from apps.operations.models import UserCourses, CourseComment, Banner
from apps.courses.models import Course
from apps.teachers.models import Teacher
from apps.experiments.models import Experiment, ExpComment


class AddCommentsView(View):
    '''用户评论'''

    def post(self, request):
        # 未登录时返回json提示未登录，跳转到登录页面是在ajax中做的
        if not request.user.is_authenticated:
            return JsonResponse({
                "status": "fail",
                "msg": "用户未登录"
            })

        course_id = int(request.POST.get("course"))
        content = request.POST.get("content")

        if course_id > 0 and content:
            course = Course.objects.get(id=course_id)

            comment = CourseComment()
            comment.user = request.user
            comment.content = content
            comment.course = course
            comment.save()

            return JsonResponse({
                "status": "success",
            })

        else:
            return JsonResponse({
                "status": "fail",
                "msg": "评论失败"
            })


class AddExpCommentsView(View):
    '''用户评论'''

    def post(self, request):
        # 未登录时返回json提示未登录，跳转到登录页面是在ajax中做的
        if not request.user.is_authenticated:
            return JsonResponse({
                "status": "fail",
                "msg": "用户未登录"
            })

        exp_id = int(request.POST.get("exp"))
        content = request.POST.get("content")

        if exp_id > 0 and content:
            exp = Experiment.objects.get(id=exp_id)

            comment = ExpComment()
            comment.user = request.user
            comment.content = content
            comment.exp = exp
            comment.save()

            return JsonResponse({
                "status": "success",
            })

        else:
            return JsonResponse({
                "status": "fail",
                "msg": "评论失败"
            })


class IndexView(View):
    def get(self, request, *args, **kwargs):
        banners = Banner.objects.order_by("index")
        return render(request, "index.html",
                      {
                          "banners": banners
                      })


class SearchResultCourseView(View):
    def get(self, request, *args, **kwargs):
        all_courses = Course.objects.order_by("-c_time")
        courses_nums = Course.objects.all().count()

        # 搜索关键词
        keywords = request.GET.get("keywords", "")
        if keywords:
            all_courses = all_courses.filter(
                Q(name__icontains=keywords) | Q(detail__icontains=keywords) | Q(tag__icontains=keywords) | Q(
                    category__icontains=keywords)| Q(teacher__name=keywords))

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        # 每页显示的记录条数
        p = Paginator(all_courses, per_page=5, request=request)
        courses = p.page(page)

        return render(request, "course_list.html", {
            "all_courses": courses,
            "courses_nums": courses_nums,
        })


class SearchResultTeacherView(View):
    def get(self, request, *args, **kwargs):
        # 从数据库中获取数据
        all_teacher = Teacher.objects.order_by("-c_time")
        teacher_nums = Teacher.objects.all().count()

        # 搜索关键词
        keywords = request.GET.get("keywords", "")
        if keywords:
            all_teacher = all_teacher.filter(
                Q(name__icontains=keywords) | Q(desc__icontains=keywords) | Q(detail__icontains=keywords))

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        # 每页显示的记录条数
        p = Paginator(all_teacher, per_page=5, request=request)
        teachers = p.page(page)

        return render(request, "teacher_list.html", {
            "teachers": teachers,
            "teacher_nums": teacher_nums,
        })


class SearchResultExpView(View):
    def get(self, request, *args, **kwargs):
        all_exp = Experiment.objects.order_by("-c_time")
        exp_num = Experiment.objects.all().count()

        # 搜索关键词
        keywords = request.GET.get("keywords", "")
        if keywords:
            all_exp = all_exp.filter(
                Q(title__icontains=keywords) | Q(detail__icontains=keywords)|Q(teacher__name=keywords))

            try:
                page = request.GET.get('page', 1)
            except PageNotAnInteger:
                page = 1

            # 每页显示的记录条数
            p = Paginator(all_exp, per_page=5, request=request)
            exps = p.page(page)

            return render(request, "experiment_list.html", {
                "all_exp": exps,
                "exp_num": exp_num,
            })
