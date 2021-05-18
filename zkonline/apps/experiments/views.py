# expriment.view
from django.shortcuts import render, redirect
from django.views.generic.base import View
from django.db.models import Q
from django.contrib.auth.mixins import LoginRequiredMixin
from pure_pagination import Paginator, PageNotAnInteger

from apps.experiments.models import Experiment, ExpReport, ExpComment, UserExp
from apps.experiments.forms import ExpReportForm


class ExpDetailView(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(self, request, exp_id, *args, **kwargs):
        exp = Experiment.objects.get(id=int(exp_id))
        exp.click_nums += 1
        exp.save()

        comments = ExpComment.objects.filter(exp=exp).order_by("-c_time")

        # 查询用户是否已经关联了该课程
        user_exp = UserExp.objects.filter(user=request.user, exp=exp)
        if not user_exp:
            user_exp = UserExp(user=request.user, exp=exp)
            user_exp.save()

            exp.student_nums += 1
            exp.save()

        return render(request, "experiment_detail.html", {
            "exp": exp,
            "comments": comments
        })


class ExpListView(LoginRequiredMixin, View):
    def get(self, request, *args, **kwargs):
        all_exp = Experiment.objects.order_by("-c_time")
        exp_num = Experiment.objects.all().count()

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


class ShowView(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(self, request, exp_id, *args, **kwargs):
        exp = Experiment.objects.get(id=int(exp_id))
        exp_index = "exp{}.html".format(str(exp_id))

        return render(request, exp_index, {
            "exp": exp,
        })


class ExpReportView(LoginRequiredMixin, View):
    login_url = "/login/"

    def get(self, request, exp_id, *args, **kwargs):
        exp_report_form = ExpReportForm(request.POST)
        report = ExpReport.objects.filter(user=request.user, exp_id=int(exp_id)).order_by("-c_time")
        exp = Experiment.objects.get(id=int(exp_id))
        if report:
            report = ExpReport.objects.get(user=request.user, exp_id=int(exp_id))
        return render(request, "experiment_report.html", {
            "exp_report_form": exp_report_form,
            "report": report,
            "exp": exp
        })

    def post(self, request, exp_id, *args, **kwargs):
        exp_report_form = ExpReportForm(request.POST)
        exp = Experiment.objects.get(id=int(exp_id))
        if exp_report_form.is_valid():
            user = request.user
            content = exp_report_form.cleaned_data['content']
            title = exp_report_form.cleaned_data['title']
            report = ExpReport.objects.filter(user=request.user, exp_id=int(exp_id))
            if not report:
                new_report = ExpReport()
                new_report.user = user
                new_report.title = title
                new_report.exp_id = exp_id
                new_report.content = content
                new_report.save()
                return render(request, "experiment_report.html", {
                    "exp_report_form": exp_report_form,
                    "report": new_report,
                    "msg": "上传成功",
                    "exp": exp
                })
            report = ExpReport.objects.get(user=request.user, exp_id=int(exp_id))
            if report.score != -1:
                return render(request, "experiment_report.html", {
                    "exp_report_form": exp_report_form,
                    "report": report,
                    "msg": "已超出可提交时间",
                    "exp": exp
                })
            else:
                report.content = content
                report.title = title
                report.save()

        return render(request, "experiment_report.html", {
            "exp_report_form": exp_report_form,
            "report": report,
            "msg": "上传成功",
            "exp": exp
        })
