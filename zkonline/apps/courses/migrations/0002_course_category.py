# Generated by Django 2.2 on 2021-02-04 01:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='category',
            field=models.CharField(max_length=20, null=True, verbose_name='课程类型'),
        ),
    ]
