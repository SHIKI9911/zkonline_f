import os
from datetime import datetime

from django.urls import reverse
from django.db import models
from django.utils import timezone
from DjangoUeditor.models import UEditorField

from apps.users.models import UserProfile
from apps.courses.models import Course
from apps.teachers.models import Teacher


class HomeworkBase(models.Model):  # 抽象表
    c_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')

    class Meta:
        abstract = True


class HomeworkTask(HomeworkBase):
    """ 发布作业 """
    teacher = models.ForeignKey(Teacher, on_delete=models.DO_NOTHING, verbose_name="教师")
    course = models.ForeignKey(Course, on_delete=models.CASCADE)  # 级联删除
    title = models.CharField(verbose_name='作业标题', max_length=100, default="")
    deadline = models.DateField(verbose_name='截止时间', default=timezone.now)
    content = UEditorField(verbose_name='正文', width=900, height=300,
                           imagePath='homework/homeworktask/img/%(basename)s_%(datetime)s.%(extname)s',
                           filePath='homework/homeworktask/file/%(basename)s_%(datetime)s.%(extname)s')
    homework_num = models.IntegerField(verbose_name="提交人数", default=0)

    class Meta:
        verbose_name = "作业任务"
        verbose_name_plural = "作业任务"

    def __str__(self):
        return self.title


class Homework(HomeworkBase):
    """ 提交作业 """
    title = models.CharField(verbose_name='作业标题', max_length=100, default="")
    teacher = models.ForeignKey(Teacher, on_delete=models.DO_NOTHING, verbose_name="教师")
    task = models.ForeignKey(HomeworkTask, on_delete=models.CASCADE)
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE, verbose_name="提交者")
    content = UEditorField(verbose_name='正文', width=900, height=300,
                           imagePath='homework/homeworkfile/img/%(basename)s_%(datetime)s.%(extname)s',
                           filePath='homework/homeworkfile/file/%(basename)s_%(datetime)s.%(extname)s')
    score = models.IntegerField(verbose_name="得分", default=-1, )
    comment = UEditorField(verbose_name="教师评语", default="")

    class Meta:
        verbose_name = "作业"
        verbose_name_plural = "作业"
        managed = True

    def __str__(self):
        return self.title
