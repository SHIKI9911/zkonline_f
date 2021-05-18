from django.conf.urls import url
from django.urls import path
from django.views.generic import TemplateView
from django.contrib.auth.decorators import login_required

from apps.users.views import UserInfoView, UserMessageView, ChangePwdView, GlobalMessageView
from apps.users.views import UploadImageView, MyCourseView,UserHomeworkView,HomeworkDetailView,UserReportView, ReportDetailView



urlpatterns = [
    url(r'^info/$', UserInfoView.as_view(), name="info"),
    url(r'^image/upload/$', UploadImageView.as_view(), name="image"),
    url(r'^update/pwd/$', ChangePwdView.as_view(), name="update_pwd"),
    url(r'^mycourse/$', MyCourseView.as_view(), name="mycourse"),
    url(r'^messages/$', UserMessageView.as_view(), name="messages"),
    url(r'^global_messages/$', GlobalMessageView.as_view(), name="g_messages"),
    url(r'^homework/$', UserHomeworkView.as_view(), name="homework"),
    url(r'^report/$', UserReportView.as_view(), name="report"),
    url(r'^homework/detail/(?P<homework_id>\d+)$', HomeworkDetailView.as_view(), name="homework_detail"),
    url(r'^report/detail/(?P<report_id>\d+)$', ReportDetailView.as_view(), name="report_detail"),

]
