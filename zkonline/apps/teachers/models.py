from django.db import models
from django.contrib.auth.validators import UnicodeUsernameValidator
from datetime import datetime


class Teacher(models.Model):
    c_time = models.DateTimeField(default=datetime.now, verbose_name='创建时间')
    gender_choices = (('male', '男'),
                      ('female', '女'))

    name = models.CharField(max_length=20, verbose_name='教师名称', null=False)
    desc = models.TextField(max_length=80, verbose_name='教师简介')
    detail = models.TextField(verbose_name='教师详情', default="略", max_length=400)
    profile_img = models.ImageField(upload_to='profile_img/teacher/%Y/%m', verbose_name='头像', max_length=500,
                                    default='/profile_img/teacher/default_profile.png')
    gender = models.CharField(verbose_name='性别', choices=gender_choices, max_length=6)
    mobile_number = models.CharField(max_length=11, null=False, unique=True, verbose_name='手机号码')
    email = models.EmailField(verbose_name='邮箱', unique=True)

    class Meta:
        verbose_name = '教师'
        verbose_name_plural = '教师'

    def __str__(self):
        return self.name

    def course_nums(self):
        return self.course_set.all().count()
