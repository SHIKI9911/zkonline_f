from django.conf.urls import url
from django.urls import path
from django.views.generic import TemplateView
from django.contrib.auth.decorators import login_required


from apps.homework.views import HomeworkSubmitView, HomeworkListView


urlpatterns = [
    url(r'^(?P<task_id>\d+)/submit/$', HomeworkSubmitView.as_view(), name="submit"),
    url(r'^(?P<course_id>\d+)/homework$', HomeworkListView.as_view(),name="list"),
    ]
