from django.contrib.auth import get_user_model
import xadmin
from xadmin import views
from django.contrib.auth.forms import (UserCreationForm, UserChangeForm,
                                       AdminPasswordChangeForm, PasswordChangeForm)
from django.contrib.auth.forms import UserCreationForm, UsernameField
from .models import *
from xadmin.layout import Fieldset, Main, Side, Row, FormHelper
from django.utils.translation import ugettext as _

from apps.users.models import UserProfile


# # 获取全局user模型
# User = get_user_model()


class MyUserCreationForm(UserCreationForm):
    class Meta:
        model = UserProfile
        fields = ("username", 'real_name', 'mobile_number', 'gender', 'email',)
        field_classes = {"username": UsernameField, }


class UserProfileAdmin(object):
    list_display = ['username', 'real_name', 'gender', 'email', 'is_teacher',  'date_joined']
    # 后台默认显示
    search_fields = ['real_name', 'mobile_number', 'email']
    # 搜索
    list_filter = ['gender', 'date_joined']
    # 过滤器
    list_editable = ['real_name', 'mobile_number', 'gender', 'email']
    # 设置可编辑字段
    readonly_fields = ["date_joined"]

    # 只读字段

    def get_form_layout(self):
        if self.org_obj:
            self.form_layout = (
                Main(
                    Fieldset('',
                             'username', 'password', 'id',
                             css_class='unsort no_title'
                             ),
                    Fieldset(_('Personal info'),
                             'real_name', 'email', 'mobile_number', 'gender', 'profile_img'
                             ),
                    Fieldset(_('Permissions'),
                             'groups', 'user_permissions'
                             ),
                    Fieldset(_('Important dates'),
                             'last_login', 'date_joined'
                             ),
                    Fieldset(_('other'),
                             'first_name', 'last_name', **{"style": "display:None"}
                             ),
                ),
                Side(
                    Fieldset(_('Status'),
                             'is_active', 'is_staff', 'is_superuser', 'is_teacher', 'whitch_teacher'
                             ),
                )
            )
        return super(UserProfileAdmin, self).get_form_layout()

    # 配置表单
    def get_model_form(self, **kwargs):
        if self.org_obj is None:
            self.form = MyUserCreationForm
        else:
            self.form = UserChangeForm
        return super(UserProfileAdmin, self).get_model_form(**kwargs)


class GlobalSetting(object):
    site_title = '环境学院教学平台'
    site_footer = '环境学院'
    menu_style = 'accodion'


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


xadmin.site.register(views.CommAdminView, GlobalSetting)
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.unregister(UserProfile)
xadmin.site.register(UserProfile, UserProfileAdmin)
