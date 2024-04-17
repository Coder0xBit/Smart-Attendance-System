# views.py
import re
import random
from django.core.mail import send_mail
from django.conf import settings
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Teacher, Student
from .serializers import TeacherSerializer, StudentSerializer

@api_view(['POST'])
def teacher_login(request):
    id = request.data.get('id')
    password = request.data.get('password')
    if id and password:
        if id == "admin" and password == "silveroak2024admin":
            return Response({'message': 'Master password verified'}, status=status.HTTP_200_OK)
        else:
            return Response({'error': 'Invalid master password'}, status=status.HTTP_401_UNAUTHORIZED)
    else:
        return Response({'error': 'ID and password required'}, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def change_teacher_password(request):
    id = request.data.get('id')
    old_password = request.data.get('old_password')
    new_password = request.data.get('new_password')
    if id and old_password and new_password:
        if old_password == "silveroak2024admin":
            try:
                teacher = Teacher.objects.get(id=id)
                teacher.password = new_password
                teacher.save()
                return Response({'message': 'Password changed successfully'}, status=status.HTTP_200_OK)
            except Teacher.DoesNotExist:
                return Response({'error': 'Teacher not found'}, status=status.HTTP_404_NOT_FOUND)
        else:
            return Response({'error': 'Invalid master password'}, status=status.HTTP_401_UNAUTHORIZED)
    else:
        return Response({'error': 'ID, old password, and new password required'}, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def student_login(request):
    email = request.data.get('email')
    
    # Validate email format and domain
    if not re.match(r'^\d{13}@silveroakuni\.ac\.in$', email):
        return Response({'error': 'Invalid email format or domain'}, status=status.HTTP_400_BAD_REQUEST)
    
    # Generate verification code
    verification_code = ''.join(random.choices('0123456789', k=6))
    
    # Save verification code in the database (you may need to adjust this part based on your model)
    try:
        student = Student.objects.get(email=email)
        student.verification_code = verification_code
        student.save()
    except Student.DoesNotExist:
        student = Student.objects.create(email=email, verification_code=verification_code)
    
    # Send verification code via email
    subject = 'Verification Code for Student Login'
    message = f'Your verification code is: {verification_code}'
    from_email = settings.EMAIL_HOST_USER
    to_email = [email]
    send_mail(subject, message, from_email, to_email)
    
    return Response({'message': 'Verification code sent successfully'}, status=status.HTTP_200_OK)

@api_view(['POST'])
def student_change_password(request):
    email = request.data.get('email')
    verification_code = request.data.get('verification_code')
    new_password = request.data.get('new_password')
    
    if email and verification_code and new_password:
        try:
            student = Student.objects.get(email=email, verification_code=verification_code)
            student.verification_code = ''  # Clear verification code after successful verification
            student.save()
            # You can now update the password for the student
            # For simplicity, let's assume the Student model has a password field
            student.password = new_password
            student.save()
            return Response({'message': 'Password changed successfully'}, status=status.HTTP_200_OK)
        except Student.DoesNotExist:
            return Response({'error': 'Student not found or invalid verification code'}, status=status.HTTP_404_NOT_FOUND)
    else:
        return Response({'error': 'Email, verification code, and new password required'}, status=status.HTTP_400_BAD_REQUEST)