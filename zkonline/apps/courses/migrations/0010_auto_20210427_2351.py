# Generated by Django 2.2 on 2021-04-27 23:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0009_remove_course_lesson_nums'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='course_img',
            field=models.ImageField(default='course_img.default_img.jpg', max_length=500, upload_to='profile_img/course_img/%Y/%m', verbose_name='课程图片'),
        ),
        migrations.AlterField(
            model_name='course',
            name='teacher',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='teachers.Teacher', verbose_name='教师'),
        ),
        migrations.AlterField(
            model_name='courseresource',
            name='file',
            field=models.FileField(max_length=200, upload_to='course/resourse/%%Y/%%m', verbose_name='下载地址'),
        ),
    ]
