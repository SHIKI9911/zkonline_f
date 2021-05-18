from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

from apps.users.models import UserProfile


class UserProfileAdmin(admin.ModelAdmin):
    pass


# xadmin可以不写下面这句也能在后台管理系统使用
admin.site.register(UserProfile, UserProfileAdmin)

