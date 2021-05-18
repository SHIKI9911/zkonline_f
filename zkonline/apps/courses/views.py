from django.shortcuts import render, HttpResponse
from django.views.generic.base import View
from pure_pagination import Paginator, PageNotAnInteger
from django.contrib.auth.mixins import LoginRequiredMixin  # 让页面需要登陆才能看到
from django.db.models import Q

from apps.courses.models import Course, Lesson, Video, CourseResource
from apps.operations.models import UserCourses, CourseComment


class CourseListView(View):
    def get(self, request, *args, **kwargs):
        # 从数据库中获取数据
        all_courses = Course.objects.order_by("-c_time")
        courses_nums = Course.objects.all().count()

        # 对课程机构数据进行分页
        # 如果没有页面，则显示一页
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


class CourseDetailView(View):
    def get(self, request, course_id, *args, **kwargs):
        # 从数据库中获取数据
        course = Course.objects.get(id=int(course_id))
        course.save()

        user_course = UserCourses.objects.filter(course=course, user=request.user)
        if user_course:
            course = Course.objects.get(id=int(course_id))
            course_resources = CourseResource.objects.filter(course=course)

            return render(request, "course_lesson.html", {
                "course": course,
                "course_resources": course_resources,
            })

        if not user_course:
            user_course = UserCourses(user=request.user, course=course)
            user_course.save()

            course.student_nums += 1
            course.save()

        return render(request, "course_detail.html", {
            "course": course,
        })


class CourseVideoView(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(self, request, course_id, video_id, *args, **kwargs):
        """
        获取课程章节信息
        """

        course = Course.objects.get(id=int(course_id))

        video = Video.objects.get(id=int(video_id))

        # 查询用户是否已经关联了该课程
        user_courses = UserCourses.objects.filter(user=request.user, course=course)
        if not user_courses:
            user_course = UserCourses(user=request.user, course=course)
            user_course.save()

            course.student_nums += 1
            course.save()

        course_resources = CourseResource.objects.filter(course=course)

        return render(request, "course_play.html", {
            "course": course,
            "course_resources": course_resources,
            "video": video,
        })


class CourseCommentsView(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(self, request, course_id, *args, **kwargs):
        course = Course.objects.get(id=int(course_id))
        comments = CourseComment.objects.filter(course=course).order_by("-c_time")

        # 查询用户是否已经关联了该课程
        user_courses = UserCourses.objects.filter(user=request.user, course=course)
        if not user_courses:
            user_course = UserCourses(user=request.user, course=course)
            user_course.save()

            course.student_nums += 1
            course.save()

        course_resources = CourseResource.objects.filter(course=course)

        return render(request, "course_comment.html", {
            "course": course,
            "course_resources": course_resources,
            "comments": comments
        })


class CourseLessonView(LoginRequiredMixin, View):
    login_url = '/login/'

    def get(self, request, course_id, *args, **kwargs):
        # 从数据库中获取数据
        course = Course.objects.get(id=int(course_id))
        course.click_nums += 1
        course.save()
        # 1. 用户和课程之间的关联
        # 2. 对view进行login登录的验证
        # 3. 其他课程

        # 查询用户是否已经关联了该课程
        user_courses = UserCourses.objects.filter(user=request.user, course=course)
        if not user_courses:
            user_course = UserCourses(user=request.user, course=course)
            user_course.save()

            course.student_nums += 1
            course.save()

        course_resources = CourseResource.objects.filter(course=course)

        return render(request, "course_lesson.html", {
            "course": course,
            "course_resources": course_resources,
        })


class DeleteCourseView(LoginRequiredMixin, View):
    login_url = '/login/'

    def get(self, request, course_id, *args, **kwargs):
        # 从数据库中获取数据
        course = Course.objects.filter(id=int(course_id))
        user_course = UserCourses.objects.filter(user_id=request.user.id, course=course_id)
        user_course.delete()

        my_courses = UserCourses.objects.filter(user=request.user)
        return render(request, "user_courses.html", {
            # "my_courses":my_courses,
            "my_courses": my_courses
        })
