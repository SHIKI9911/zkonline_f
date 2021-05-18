import xadmin

from apps.operations.models import CourseComment, UserMessage, UserCourses, Banner, GlobalMessage


class CourseCommentAdmin(object):
    list_display = ['user', 'course', 'content']
    # 后台默认显示
    search_fields = ['user', 'course']
    # 搜索
    list_filter = ['user', 'course']
    # 过滤器
    list_editable = ['user', 'course', 'content']
    # 设置可编辑字段


class BannerAdmin(object):
    list_display = ['title', 'image', 'url', 'index']
    # 后台默认显示
    search_fields = ['title', 'index']
    # 搜索
    list_filter = ['title', 'index']
    # 过滤器
    list_editable = ['title', 'image', 'url', 'index']
    # 设置可编辑字段


class UserMessageAdmin(object):
    list_display = ['user', 'content', 'has_read']
    # 后台默认显示
    search_fields = ['user', 'content']
    # 搜索
    list_filter = ['user', 'content', 'has_read']
    # 过滤器
    list_editable = ['user', 'content', 'has_read']
    # 设置可编辑字段


class UserCoursesAdmin(object):
    list_display = ['user', 'course', 'is_finished']
    # 后台默认显示
    search_fields = ['user', 'course', 'is_finished']
    # 搜索
    list_filter = ['user', 'course', 'is_finished']
    # 过滤器
    list_editable = ['user', 'course', 'is_finished']

    # 设置可编辑字段

    def save_models(self):
        obj = self.new_obj
        if not obj.id:
            obj.save()
            course = obj.course
            course.student_nums += 1
            course.save()


class GlobalMessageAdmin(object):
    list_display = ['title', 'content', 'c_time']
    # 后台默认显示
    search_fields = ['title']
    # 搜索
    list_filter = ['title']
    # 过滤器
    list_editable = ['content']
    # 设置可编辑字段


xadmin.site.register(CourseComment, CourseCommentAdmin)
xadmin.site.register(UserCourses, UserCoursesAdmin)
xadmin.site.register(UserMessage, UserMessageAdmin)
xadmin.site.register(Banner, BannerAdmin)
xadmin.site.register(GlobalMessage, GlobalMessageAdmin)