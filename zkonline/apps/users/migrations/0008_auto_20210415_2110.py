# Generated by Django 2.2 on 2021-04-15 21:10

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0007_auto_20210415_2040'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='whitch_teacher',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='teachers.Teacher'),
        ),
    ]
