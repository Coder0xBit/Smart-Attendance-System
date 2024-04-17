# serializers.py
from rest_framework import serializers
from .models import Teacher, Student

class TeacherSerializer(serializers.ModelSerializer):
    class Meta:
        model = Teacher
        fields = ['id', 'password', 'new_password', 'is_teacher']

class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = ['email', 'verification_code']