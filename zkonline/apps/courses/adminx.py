import xadmin
from xadmin.layout import Fieldset, Main, Side, Row, FormHelper
from django.utils.translation import ugettext as _
from import_export import resources

from apps.courses.models import Course, Lesson, Video, CourseResource
from apps.homework.models import HomeworkTask


class LessonInline(object):
    model = Lesson
    extra = 0


class CourseResourceInline(object):
    model = CourseResource
    extra = 0


class HomeworkTaskInline(object):
    model = HomeworkTask
    extra = 0


class VideoInline(object):
    model = Video
    extra = 0


class CourseAdmin(object):
    list_display = ['name', 'category', 'tag', 'learn_times', 'click_nums', 'student_nums', 'lesson_nums', 'teacher']
    # 后台默认显示
    search_fields = ['name', 'tag', 'category']
    # 搜索
    list_filter = ['tag', 'category']
    # 过滤器
    list_editable = ['name', 'notice', 'tag', 'detail', 'category', 'course_img']
    # 设置可编辑字段
    readonly_fields = ['click_nums', 'student_nums', "c_time"]
    # 只读字段

    inlines = [LessonInline, CourseResourceInline, HomeworkTaskInline]  # 增加章节和课程资源、作业, 添加课程的时候，可以直接添加章节和课程资源


class MyResource(resources.ModelResource):
    class Meta:
        model = Course


class NewCourseAdmin(object):
    import_export_args = {'import_resource_class': MyResource, 'export_resource_class': MyResource}
    list_display = ['name', 'category', 'tag', 'learn_times', 'click_nums', 'student_nums', 'teacher']
    search_fields = ['name', 'tag', 'category']
    list_filter = ['tag', 'category']
    list_editable = ['name', 'notice', 'tag', 'detail', 'category', 'course_img']
    readonly_fields = ['click_nums', 'student_nums', "c_time"]
    model_icon = 'fa fa-address-book'
    inlines = [LessonInline, CourseResourceInline, HomeworkTaskInline]

    def queryset(self):
        qs = super().queryset()
        if not self.request.user.is_superuser:
            qs = qs.filter(teacher=self.request.user.whitch_teacher)
        return qs

    def get_form_layout(self):
        if self.org_obj:
            self.form_layout = (
                Main(
                    Fieldset('课程信息',
                             'name', 'detail', 'tag', 'category', 'notice', 'teacher', 'course_img'
                             ),
                    Fieldset('课程数据',
                             'learn_times', 'click_nums', 'student_nums', 'c_time'
                             ),
                ),
            )
        return super(NewCourseAdmin, self).get_form_layout()


class LessonAdmin(object):
    list_display = ['course', 'name', 'learn_times', 'teacher']
    # 后台默认显示
    search_fields = ['course', 'name']
    # 搜索
    list_filter = ['course', 'name', 'learn_times']
    # 过滤器
    list_editable = ['course', 'name', 'learn_times', 'teacher']
    # 设置可编辑字段
    readonly_fields = ['course', 'c_time', 'teacher']
    # 只读字段
    inlines = [VideoInline]

    def queryset(self):
        qs = super().queryset()
        lesson = Lesson.objects
        if not self.request.user.is_superuser:
            qs = qs.filter(teacher=self.request.user.whitch_teacher)
        return qs

    def save_models(self):
        obj = self.new_obj
        obj.teacher = obj.course.teacher
        obj.save()


class VideoAdmin(object):
    list_display = ['lesson', 'name', 'learn_times']
    # 后台默认显示
    search_fields = ['lesson', 'name', 'learn_times']
    # 搜索
    list_filter = ['lesson', 'name', 'learn_times']
    # 过滤器
    list_editable = ['lesson', 'name', 'learn_times', 'url']
    # 设置可编辑字段
    readonly_fields = ["c_time"]
    # 只读字段


class CourseResourceAdmin(object):
    list_display = ['course', 'name', 'file']
    # 后台默认显示
    search_fields = ['course', 'name']
    # 搜索
    list_filter = ['course', 'name']
    # 过滤器
    list_editable = ['course', 'name', 'file']
    # 设置可编辑字段
    readonly_fields = ["c_time"]
    # 只读字段


xadmin.site.register(Course, NewCourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
# xadmin.site.register(Video, VideoAdmin)
# xadmin.site.register(CourseResource, CourseResourceAdmin)
