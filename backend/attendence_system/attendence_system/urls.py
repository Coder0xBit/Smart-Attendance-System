# urls.py
from django.urls import path
from attendence_system_app.views import teacher_login, change_teacher_password, student_login, student_change_password

urlpatterns = [
    path('api/teacher/login/', teacher_login),
    path('api/teacher/change_password/', change_teacher_password),
    path('api/student/login/', student_login),
    path('api/student/change_password/', student_change_password),
]