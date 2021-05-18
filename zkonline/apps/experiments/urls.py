from django.conf.urls import url
from django.urls import path
from django.views.generic import TemplateView
from django.contrib.auth.decorators import login_required
from apps.experiments.views import ExpDetailView, ExpReportView, ExpListView, ShowView


urlpatterns = [
    url(r'^list/$', ExpListView.as_view(), name="list"),
    url(r'^(?P<exp_id>\d+)/report/$',ExpReportView.as_view(), name="report"),
    url(r'^(?P<exp_id>\d+)/detail/$', ExpDetailView.as_view(), name="detail"),
    url(r'^show/(?P<exp_id>\d+)/$', ShowView.as_view(), name="show"),
]
