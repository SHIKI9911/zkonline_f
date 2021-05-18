# users.view
from django.shortcuts import render, redirect
from django.views.generic.base import View
from django.contrib.auth import authenticate, login, logout
from django.http import HttpResponseRedirect, JsonResponse
from django.urls import reverse
import hashlib
from django.contrib.auth.mixins import LoginRequiredMixin
from pure_pagination import Paginator, PageNotAnInteger
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
import datetime
from django.utils import timezone

from apps.users.models import UserProfile
from apps.users.forms import Login_Form, RegisterForm, UserInfoForm, ChangePwdForm, UploadImageForm
from apps.operations.models import UserCourses, UserMessage
from apps.homework.models import Homework, HomeworkTask
from apps.homework.forms import HomeworkForm
from apps.experiments.models import Experiment, ExpReport
from apps.experiments.forms import ExpReportForm
from apps.operations.models import UserMessage, GlobalMessage, Banner


# def hash_code(s, salt='zkonline'):
#     h = hashlib.sha256()
#     s += salt
#     h.update(s.encode())  # update方法只接收bytes类型
#     return h.hexdigest()


class CustomAuth(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username) | Q(mobile_number=username) | Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class LogoutView(View):
    def get(self, request, *args, **kwargs):
        logout(request)
        return HttpResponseRedirect(reverse("index"))


class LoginView(View):
    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            return HttpResponseRedirect(reverse("index"))
        else:
            login_form = Login_Form()
            return render(request, 'login.html', locals())

    def post(self, request, *args, **kwargs):
        # 表单验证
        login_form = Login_Form(request.POST)

        if login_form.is_valid():
            user_name = login_form.cleaned_data["username"]
            password = login_form.cleaned_data["password"]
            # 用户名密码的验证
            user = authenticate(username=user_name, password=password)
            if user is not None:
                # 查询到用户, 使用该方法可以不用管session等细节
                login(request, user)
                # 登陆成功之后如何返回页面
                # return render(request, 'index.html') # render的使用有细节不完善
                return HttpResponseRedirect(reverse("index"))
            else:
                # 未查询到用户, 保持在原来页面并做出提示
                return render(request, 'login.html', {"msg": "用户名或密码错误", "login_form": login_form})

        else:
            return render(request, "login.html", {"msg": "用户名或密码错误", "login_form": login_form})


class RegisterView(View):
    def get(self, request, *args, **kwargs):
        register_form = RegisterForm()
        # 如果已登录，则返回首页
        if request.user.is_authenticated:
            return HttpResponseRedirect(reverse("index"))
        else:
            return render(request, 'register.html', {"register_form": register_form})

    def post(self, request, *args, **kwargs):
        register_form = RegisterForm(request.POST)
        msg = "请检查填写的内容"
        if register_form.is_valid():
            username = register_form.cleaned_data['username']
            password1 = register_form.cleaned_data['password1']
            password2 = register_form.cleaned_data['password2']
            email = register_form.cleaned_data['email']
            sex = register_form.cleaned_data['sex']
            mobile_number = register_form.cleaned_data['mobile_number']

            if password1 != password2:  # 判断两次密码是否相同
                msg = "两次输入的密码不同！"
                return render(request, 'register.html', locals())
            else:
                same_name_user = UserProfile.objects.filter(username=username)
                if same_name_user:  # 用户名唯一
                    msg = '用户已经存在，请重新选择用户名！'
                    return render(request, 'register.html', locals())
                same_email_user = UserProfile.objects.filter(email=email)
                if same_email_user:  # 邮箱地址唯一
                    msg = '该邮箱地址已被注册，请使用别的邮箱！'
                    return render(request, 'register.html', locals())
                same_mobile_user = UserProfile.objects.filter(mobile_number=mobile_number)
                if same_mobile_user or len(mobile_number) != 11:
                    msg = "该手机号不正确或已注册"
                    return render(request, 'register.html', locals())

                # 将数据存入数据库
                new_user = UserProfile.objects.create()
                new_user.username = username
                new_user.set_password(password1)  # 使用加密密码
                new_user.email = email
                new_user.gender = sex
                new_user.mobile_number = mobile_number
                new_user.save()
                new_message = UserMessage()
                new_message.user = new_user
                new_message.content = "欢迎注册"
                new_message.save()

                # 登陆
                banners = Banner.objects.order_by("index")
                return render(request, "index.html",
                              {
                                  "banners": banners
                              })  # 自动跳转到登录页面

        else:
            register_form = RegisterForm()
            return render(request, 'register.html', {
                "register_form": register_form,
            })


class UserInfoView(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(self, request, *args, **kwargs):
        user = request.user
        return render(request, 'user_info.html', {
            "user": user,
        })

    def post(self, request, *args, **kwargs):
        user_info_form = UserInfoForm(request.POST, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return JsonResponse({
                "status": "success"
            })
        else:
            return JsonResponse(user_info_form.errors)


class ChangePwdView(LoginRequiredMixin, View):
    login_url = "/login/"

    def post(self, request, *args, **kwargs):
        pwd_form = ChangePwdForm(request.POST)
        if pwd_form.is_valid():
            pwd1 = request.POST.get("password1", "")
            user = request.user
            user.set_password(pwd1)
            user.save()

            return JsonResponse({
                "status": "success"
            })
        else:
            return JsonResponse(pwd_form.errors)


class UploadImageView(View):
    login_url = "/login/"

    def post(self, request, *args, **kwargs):
        # 处理用户上传的头像
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            image_form.save()
            return JsonResponse({
                "status": "success"
            })
        else:
            return JsonResponse({
                "status": "fail"
            })


class MyCourseView(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(self, request, *args, **kwargs):
        my_courses = UserCourses.objects.filter(user=request.user)
        return render(request, "user_courses.html", {
            # "my_courses":my_courses,
            "my_courses": my_courses
        })


class UserMessageView(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(self, request, *args, **kwargs):
        messages = UserMessage.objects.filter(user=request.user).order_by("-c_time")

        current_page = "message"
        for message in messages:
            message.has_read = True
            message.save()

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(messages, per_page=10, request=request)
        messages = p.page(page)

        return render(request, "user_message.html", {
            "messages": messages,
            "current_page": current_page,
        })


class GlobalMessageView(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(self, request, *args, **kwargs):
        global_messages = GlobalMessage.objects.all().order_by("-c_time")

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(global_messages, per_page=10, request=request)
        messages = p.page(page)

        return render(request, "global_message.html", {
            "messages": messages,

        })


class UserHomeworkView(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(self, request, *args, **kwargs):
        user = request.user
        homework_list = user.homework_set.all().order_by("-c_time")

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(homework_list, per_page=10, request=request)
        homework_list = p.page(page)
        return render(request, "user_homework.html", {
            "homework_list": homework_list,
        })


class HomeworkDetailView(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(self, request, homework_id, *args, **kwargs):
        homework = Homework.objects.get(id=int(homework_id))
        homework_form = HomeworkForm(request.POST)

        return render(request, "homework_detail.html", {
            "homework": homework,
            "homework_form": homework_form,
        })

    def post(self, request, homework_id, *args, **kwargs):
        homeworkForm = HomeworkForm(request.POST)
        homework = Homework.objects.get(user=request.user)
        is_outdate = self.date_compare(str(homework.task.deadline), str(timezone.now))

        if is_outdate:
            return render(request, "homework_detail.html", {
                "homework_form": homeworkForm,
                "msg": "已超出可提交时间",
            })
        else:
            if homeworkForm.is_valid():
                user = request.user
                content = homeworkForm.cleaned_data['content']
                if homework.score != -1:
                    return render(request, "homework_detail.html", {
                        "homework_form": homeworkForm,
                        "msg": "已超出可提交时间",
                        "homework": homework,
                    })
                homework.content = content
                homework.save()
                return render(request, "homework_detail.html", {
                    "homework_form": homeworkForm,
                    "msg": "上传成功",
                    "homework": homework,
                })

        return render(request, "homework_detail.html", {
            "homework_form": homeworkForm,
            "msg": "上传失败",
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


class UserReportView(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(self, request, *args, **kwargs):
        user = request.user
        report_list = ExpReport.objects.filter(user=request.user).order_by("-c_time")

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(report_list, per_page=10, request=request)
        report_list = p.page(page)
        return render(request, "user_report.html", {
            "report_list": report_list,
        })


class ReportDetailView(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(self, request, report_id, *args, **kwargs):
        report = ExpReport.objects.get(id=int(report_id))
        report_form = ExpReportForm(request.POST)

        return render(request, "report_detail.html", {
            "report": report,
            "report_form": report_form,
        })

    def post(self, request, report_id, *args, **kwargs):
        reportForm = ExpReportForm(request.POST)
        report = ExpReport.objects.get(id=int(report_id))

        if reportForm.is_valid():
            content = reportForm.cleaned_data['content']
            if report.score != -1:
                return render(request, "report_detail.html", {
                    "report_form": reportForm,
                    "msg": "已超出可提交时间",
                    "report": report,
                })
            report.content = content
            report.save()
            return render(request, "report_detail.html", {
                "report_form": reportForm,
                "msg": "上传成功",
                "report": report,
            })

        return render(request, "report_detail.html", {
            "report_form": reportForm,
            "msg": "上传失败",
            "report": report,
        })
