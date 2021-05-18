# experiments.models
from django.db import models

from DjangoUeditor.models import UEditorField

from apps.users.models import BaseModel
from apps.teachers.models import Teacher
from apps.users.models import UserProfile


class Experiment(BaseModel):
    title = models.CharField(verbose_name='实验名', max_length=100)
    teacher = models.ForeignKey(Teacher, on_delete=models.DO_NOTHING)
    notice = models.CharField(verbose_name='实验需知', max_length=300, default="")
    click_nums = models.IntegerField(verbose_name='点击量', default=0)
    student_nums = models.IntegerField(verbose_name='学生数', default=0)
    detail = models.TextField(verbose_name='实验详情', max_length=500)
    img = models.ImageField(verbose_name='封面图', upload_to="experiment/img/%Y/%m", max_length=500)

    class Meta:
        verbose_name = "实验"
        verbose_name_plural = "实验"

    def __str__(self):
        return self.title


class ExpReport(BaseModel):
    title = models.CharField(verbose_name='报告标题', max_length=100, default="")
    teacher = models.ForeignKey(Teacher, on_delete=models.DO_NOTHING, default=1)
    exp = models.ForeignKey(Experiment, on_delete=models.CASCADE)
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    content = UEditorField(verbose_name="内容", width=900, height=600,
                           imagePath="experiment/report/img/%Y/%m",
                           filePath="experiment/report/file/%Y/%m")
    score = models.IntegerField(verbose_name="评分", default=-1)
    comment = models.TextField(verbose_name='教师评价', max_length=500, default="")

    class Meta:
        verbose_name = "实验报告"
        verbose_name_plural = "实验报告"

    def __str__(self):
        return self.title


class ExpComment(BaseModel):
    user = models.ForeignKey(UserProfile, verbose_name='用户', on_delete=models.CASCADE)
    exp = models.ForeignKey(Experiment, verbose_name='实验', on_delete=models.CASCADE)
    content = models.CharField(max_length=500, verbose_name='评论内容')

    class Meta:
        verbose_name = '实验评论'
        verbose_name_plural = '实验评论'


class UserExp(BaseModel):
    exp = models.ForeignKey(Experiment, on_delete=models.CASCADE)
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)

    class Meta:
        verbose_name = "用户实验关联"
        verbose_name_plural = "用户实验关联"
