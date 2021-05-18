from django.conf.urls import url

from apps.operations.views import (AddCommentsView, SearchResultExpView,
SearchResultTeacherView, SearchResultCourseView, AddExpCommentsView)

urlpatterns = [
    url(r'^comment/$', AddCommentsView.as_view(), name="comment"),
    url(r'^search/courses$', SearchResultCourseView.as_view(), name="search_course"),
    url(r'^search/teachers$', SearchResultTeacherView.as_view(), name="search_teacher"),
    url(r'^search/experiments$', SearchResultExpView.as_view(), name="search_exp"),
    url(r'^exp_comment/$', AddExpCommentsView.as_view(), name="exp_comment"),
]
