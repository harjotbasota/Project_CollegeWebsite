# Generated by Django 3.0 on 2024-04-09 20:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0004_auto_20240409_1631'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customusers',
            name='course',
            field=models.CharField(choices=[('F', 'Front-end Software Development'), ('B', 'Backend Software Development'), ('C', 'Cloud Computing'), ('I', 'Internet of Things'), ('M', 'Machine Learning')], default='F', max_length=1),
            preserve_default=False,
        ),
    ]
