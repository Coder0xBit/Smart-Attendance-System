# models.py
from django.db import models

class Teacher(models.Model):
    id = models.CharField(max_length=20, unique=True)
    password = models.CharField(max_length=100)
    new_password = models.CharField(max_length=100, blank=True, null=True)
    is_teacher = models.BooleanField(default=True)

    class Meta:
        app_label = 'attendence_system'

class Student(models.Model):
    email = models.EmailField(unique=True)
    verification_code = models.CharField(max_length=6)

    class Meta:
        app_label = 'attendence_system'