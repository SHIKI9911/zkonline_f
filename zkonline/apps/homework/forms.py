from apps.homework.models import HomeworkTask, Homework
from django import forms


class HomeworkTaskForm(forms.ModelForm):  # 发布作业
    class Meta:
        model = HomeworkTask
        fields = ["course", "title", "deadline", "content"]


class HomeworkForm(forms.ModelForm):
    class Meta:
        model = Homework
        fields = ["content","title"]