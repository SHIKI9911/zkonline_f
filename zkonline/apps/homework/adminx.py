import xadmin
from xadmin.layout import Fieldset, Main, Side, Row, FormHelper
from django.utils.translation import ugettext as _

from apps.homework.models import HomeworkTask, Homework
from apps.operations.models import UserMessage


class HomeworkTaskAdmin(object):
    list_display = ['course', 'title', 'deadline', 'c_time', 'content']
    # 后台默认显示
    search_fields = ['course', 'title']
    # 搜索
    list_filter = ['course', 'title']
    # 过滤器
    list_editable = ['course', 'title', 'deadline', 'content']
    # 设置可编辑字段
    readonly_fields = ['c_time', 'teacher']
    # 只读字段
    style_fields = {
        'content': 'ueditor'
    }

    def save_models(self):
        obj = self.new_obj
        if not obj.id:
            obj.teacher = obj.course.teacher
            obj.save()

    def queryset(self):
        qs = super().queryset()
        if not self.request.user.is_superuser:
            qs = qs.filter(teacher=self.request.user.whitch_teacher)
        return qs


class HomeworkAdmin(object):
    list_display = ['task', "title", 'user', 'score', 'comment']
    # 后台默认显示
    search_fields = ['course', 'title']
    # 搜索
    list_filter = ['task', 'user']
    # 过滤器
    list_editable = ['score', 'comment']
    # 设置可编辑字段
    readonly_fields = ['task', 'user', 'c_time', 'teacher']
    # 只读字段
    style_fields = {
        'content': 'ueditor'
    }

    def save_models(self):
        obj = self.new_obj
        obj.teacher = obj.task.course.teacher
        obj.save()

        if obj.score != -1:
            new_message = UserMessage()
            new_message.content = "您提交的一份作业已评阅完毕，请及时查看"
            new_message.user = obj.user
            new_message.save()


def queryset(self):
    qs = super().queryset()
    if not self.request.user.is_superuser:
        qs = qs.filter(teacher=self.request.user.whitch_teacher)
    return qs


xadmin.site.register(HomeworkTask, HomeworkTaskAdmin)
xadmin.site.register(Homework, HomeworkAdmin)
