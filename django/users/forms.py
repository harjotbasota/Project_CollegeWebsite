from .models import CustomUsers
from django.contrib.auth.forms import UserCreationForm, UserChangeForm

class CustomUserCreationForm(UserCreationForm):
    class Meta(UserCreationForm):
        model=CustomUsers
        fields=('username','course','email','date_of_birth')

class CustomUserChangeForm(UserChangeForm):
    class Meta(UserChangeForm):
        model=CustomUsers
        fields=('username','course','email','date_of_birth')