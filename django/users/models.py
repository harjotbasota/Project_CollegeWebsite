from django.db import models
from django.contrib.auth.models import AbstractUser
import datetime
from django.urls import reverse

class CustomUsers(AbstractUser):
    courses_options=[
        ('Front-end Software Development','Front-end Software Development'),
        ('Backend Software Development','Backend Software Development'),
        ('Cloud Computing','Cloud Computing'),
        ('Internet of Things','Internet of Things'),
        ('Machine Learning','Machine Learning')
    ]
    course= models.CharField(max_length=100,choices=courses_options)
    estimated_fees=models.CharField(max_length=6,default="$14000")
    date_of_birth=models.DateField(default=datetime.date(2000,1,1))

    def __str__(self):
        return self.username
    def get_absolute_url(self):
        return reverse('login')
