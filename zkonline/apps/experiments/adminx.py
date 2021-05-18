import xadmin

from apps.experiments.models import Experiment, ExpReport, ExpComment


class ExperimentAdmin(object):
    list_display = ['title', 'teacher', 'notice', "click_nums", "student_nums", "detail", "img"]
    # 后台默认显示
    search_fields = ['title', 'teacher']
    # 搜索
    list_filter = ['title', 'teacher']
    # 过滤器
    list_editable = ['title', 'teacher', 'notice', "detail", "img"]
    # 设置可编辑字段
    readonly_fields = ["c_time"]

    # 只读字段

    def queryset(self):  # 设置各组能看到什么
        qs = super().queryset()
        if not self.request.user.is_superuser:
            qs = qs.filter(teacher=self.request.user.whitch_teacher)
        return qs


class ExpReportAdmin(object):
    list_display = ['exp', 'user', "score", "comment", "c_time"]
    # 后台默认显示
    search_fields = ['exp', 'user']
    # 搜索
    list_filter = ['exp', 'user']
    # 过滤器
    list_editable = ["score", "comment"]
    # 设置可编辑字段
    readonly_fields = ['exp', 'user', "c_time"]
    # 只读字段

    style_fields = {
        "content": "ueditor"
    }

    def queryset(self):
        qs = super().queryset()
        if not self.request.user.is_superuser:
            qs = qs.filter(teacher=self.request.user.whitch_teacher)
        return qs

    def save_models(self):
        obj = self.new_obj
        if not obj.id:
            obj.teacher = obj.exp.teacher
            obj.save()


class ExpCommentView(object):
    list_display = ['user', 'exp', 'content']
    # 后台默认显示
    search_fields = ['user', 'exp']
    # 搜索
    list_filter = ['user', 'exp']
    # 过滤器
    list_editable = ['user', 'exp', 'content']
    # 设置可编辑字段
    readonly_fields = ["c_time"]
    # 只读字段


xadmin.site.register(ExpReport, ExpReportAdmin)
xadmin.site.register(Experiment, ExperimentAdmin)
xadmin.site.register(ExpComment, ExpCommentView)
