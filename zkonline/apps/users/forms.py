from django import forms
from captcha.fields import CaptchaField

from apps.users.models import UserProfile


class Login_Form(forms.Form):
    username = forms.CharField(label="用户名", max_length=128, widget=forms.TextInput(attrs={'class': 'form-control'}))
    password = forms.CharField(label="密码", max_length=256, widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    captcha = CaptchaField(label='验证码')


# class DynamicLoginForm(forms.Form):
#     mobile = forms.CharField(required=True, min_length=11, max_length=11)
#     captcha = CaptchaField()


class RegisterForm(forms.Form):
    gender = (
        ('male', "男"),
        ('female', "女"),
    )
    username = forms.CharField(label="用户名", min_length=2, widget=forms.TextInput(attrs={'class': 'form-control'}))
    password1 = forms.CharField(label="密码", min_length=6, widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    password2 = forms.CharField(label="确认密码", min_length=6, widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    email = forms.EmailField(label="邮箱地址", widget=forms.EmailInput(attrs={'class': 'form-control'}))
    sex = forms.ChoiceField(label='性别', choices=gender)
    mobile_number = forms.CharField(label='手机号码', max_length=11,
                                    widget=forms.TextInput(attrs={'class': 'form-control'}))
    captcha = CaptchaField(label='验证码')


class UserInfoForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ["username", "real_name", "mobile_number", "email", "gender"]


class UploadImageForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ["profile_img"]


class ChangePwdForm(forms.Form):
    password1 = forms.CharField(required=True, min_length=5)
    password2 = forms.CharField(required=True, min_length=5)

    def clean(self):
        pwd1 = self.cleaned_data["password1"]
        pwd2 = self.cleaned_data["password2"]

        if pwd1 != pwd2:
            raise forms.ValidationError("密码不一致")
        return self.cleaned_data
