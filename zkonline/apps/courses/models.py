from django.db import models

from apps.users.models import BaseModel
from apps.teachers.models import Teacher

'''设计表结构：
1、实体间的关系：一对多，多对多。
课程-章节：一个课程有多个章节
章节-小节：一个章节有多个小节（视频）
课程-资料：一个课程对应多个课程资源
所以有四个实体：课程 章节 小节 资料
2、实体的具体字段
3、每个字段的类型，是否必填（默认为必填）
'''


class Course(BaseModel):
    name = models.CharField(verbose_name='课程名', max_length=100)
    notice = models.CharField(verbose_name='课程公告', max_length=300)
    learn_times = models.IntegerField(verbose_name='学习时长(分钟）', default=0)
    click_nums = models.IntegerField(verbose_name='点击量', default=0)
    student_nums = models.IntegerField(verbose_name='学生数', default=0)
    category = models.CharField(null=True, max_length=20, verbose_name='课程类型')
    tag = models.CharField(verbose_name='标签', default='', max_length=20)
    detail = models.TextField(verbose_name='课程详情', max_length=500)
    course_img = models.ImageField(verbose_name='课程图片', upload_to='profile_img/course_img/%Y/%m',
                                   default='course_img.default_img.jpg', max_length=500)  # 访问路径为url，在浏览器中无法访问本地
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE, verbose_name="教师")

    class Meta:
        verbose_name = '课程信息'
        verbose_name_plural = '课程信息'

    def __str__(self):
        return self.name

    def lesson_nums(self):
        return self.lesson_set.all().count()

    def get_course_lesson(self):
        return self.lesson_set.all()


class Lesson(BaseModel):
    course = models.ForeignKey(Course, on_delete=models.CASCADE)
    # 使用ForeignKey来引入外键，on_delete：删除了外键后是否保留当前数据, CASCADE——级联删除
    # 此处设计为course删除后，不保留Lesson数据
    name = models.CharField(max_length=100, verbose_name="章节名")
    learn_times = models.IntegerField(default=0, verbose_name="学习时长(分钟数)")
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE, verbose_name="教师", null=True)

    class Meta:
        verbose_name = '课程章节'
        verbose_name_plural = '课程章节'

    def __str__(self):
        return self.name


class Video(BaseModel):
    lesson = models.ForeignKey(Lesson, verbose_name="章节", on_delete=models.CASCADE)
    name = models.CharField(max_length=100, verbose_name=u"视频名")
    learn_times = models.IntegerField(default=0, verbose_name=u"学习时长(分钟数)")
    url = models.CharField(max_length=1000, verbose_name=u"访问地址")

    class Meta:
        verbose_name = "视频"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class CourseResource(BaseModel):
    course = models.ForeignKey(Course, on_delete=models.CASCADE, verbose_name="课程")
    name = models.CharField(max_length=100, verbose_name=u"名称")
    file = models.FileField(upload_to="course/resourse/%%Y/%%m", verbose_name="下载地址", max_length=200)

    class Meta:
        verbose_name = "课程资源"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
