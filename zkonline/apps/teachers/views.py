from django.shortcuts import render
from django.views.generic.base import View
from pure_pagination import Paginator, PageNotAnInteger

from apps.teachers.models import Teacher


class TeacherListView(View):
    def get(self, request, *args, **kwargs):
        # 从数据库中获取数据
        all_teacher = Teacher.objects.order_by("-c_time")
        teacher_nums = Teacher.objects.all().count()

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


class TeacherDetailView(View):
    def get(self, request, teacher_id, *args, **kwargs):
        # 从数据库中获取数据
        teacher = Teacher.objects.get(id=int(teacher_id))
        teacher.save()

        return render(request, "teacher_detail.html", {
            "teacher": teacher,
        })
