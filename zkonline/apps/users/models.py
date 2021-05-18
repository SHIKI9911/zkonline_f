from datetime import datetime

from django.contrib.auth.models import AbstractUser
from django.db import models

from apps.teachers.models import Teacher

class BaseModel(models.Model):  # 方便被继承的基础类
    c_time = models.DateTimeField(default=datetime.now, verbose_name='创建时间')

    # 自动生成创建时间，注意不要写成datetime.now()，那样无法在生成实例的时候实时生成创建时间

    class Meta:
        abstract = True  # 这样就不会生成BASE的表


class UserProfile(AbstractUser):  # 用户信息
    gender_choices = (('male', '男'),
                      ('female', '女'))

    real_name = models.CharField(max_length=50, verbose_name='真实姓名', default='')
    # 注册的时候不需要填入真实姓名，在上课时，老师可以让学生输入自己的真实姓名以帮助管理，故可以为空
    mobile_number = models.CharField(max_length=11, null=False, verbose_name='手机号码')
    # 必须填入手机号，不能为空，不可重复
    gender = models.CharField(verbose_name='性别', choices=gender_choices, max_length=6)
    # 性别为男或者女，max_length 为 female 单词的长度
    profile_img = models.ImageField(verbose_name='头像', upload_to='profile_img/user/%Y/%m',
                                    default='profile_img/teacher/default_profile.png', max_length=500)
    is_teacher = models.BooleanField(verbose_name="是否教师",default=False)
    whitch_teacher = models.OneToOneField(Teacher, on_delete=models.DO_NOTHING, null=True)

    # 头像, 自动上传到profile_img当中, 默认头像为media/profile_img/teacher/default_profile.png

    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = '用户信息'

    def __str__(self):
        if self.real_name:
            return self.real_name
        else:
            return self.username
