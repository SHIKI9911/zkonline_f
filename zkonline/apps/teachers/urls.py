from django.conf.urls import url
from django.urls import path

from apps.teachers.views import TeacherListView, TeacherDetailView


urlpatterns = [
    url('list', TeacherListView.as_view(), name="list"),
    url(r'^(?P<teacher_id>\d+)/$', TeacherDetailView.as_view(), name="detail"),
]
