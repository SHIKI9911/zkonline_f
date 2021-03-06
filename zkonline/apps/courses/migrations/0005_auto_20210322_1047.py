# Generated by Django 2.2 on 2021-03-22 10:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0004_auto_20210322_1046'),
    ]

    operations = [
        migrations.AlterField(
            model_name='course',
            name='desc',
            field=models.CharField(max_length=300, verbose_name='课程描述'),
        ),
        migrations.AlterField(
            model_name='course',
            name='name',
            field=models.CharField(max_length=100, verbose_name='课程名'),
        ),
        migrations.AlterField(
            model_name='courseresource',
            name='name',
            field=models.CharField(max_length=100, verbose_name='名称'),
        ),
        migrations.AlterField(
            model_name='lesson',
            name='name',
            field=models.CharField(max_length=100, verbose_name='章节名'),
        ),
        migrations.AlterField(
            model_name='video',
            name='name',
            field=models.CharField(max_length=100, verbose_name='视频名'),
        ),
    ]
