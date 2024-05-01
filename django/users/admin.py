from .forms import UserChangeForm,UserCreationForm
from .models import CustomUsers
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin

class CustomUserAdmin(UserAdmin):
    add_form=UserCreationForm
    form=UserChangeForm
    model=CustomUsers
    list_display=('username','email','course','id','date_of_birth')

admin.site.register(CustomUsers,CustomUserAdmin)
