# Generated by Django 2.2 on 2021-04-20 17:23

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('operations', '0003_banner'),
    ]

    operations = [
        migrations.CreateModel(
            name='GlobalMessage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('c_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='创建时间')),
                ('title', models.TextField(verbose_name='消息标题')),
                ('content', models.TextField(verbose_name='消息内容')),
            ],
            options={
                'verbose_name': '全局消息',
                'verbose_name_plural': '全局消息',
            },
        ),
    ]
