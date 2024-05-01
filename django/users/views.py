from django.views.generic.edit import CreateView
from django.views.generic import DetailView, TemplateView
from .models import CustomUsers
from .forms import CustomUserCreationForm
from django.contrib.auth.mixins import UserPassesTestMixin

class SameUserMixin(UserPassesTestMixin):
    def test_func(self):
        return self.request.user.id == self.get_object().id
    
class AdmissionView(CreateView):
    template_name='admissions.html'
    model=CustomUsers
    form_class=CustomUserCreationForm

class ProfileView(SameUserMixin,DetailView):
    template_name='profile.html'
    model=CustomUsers
    context_object_name:'object'

class AlterProfileView(TemplateView):
    template_name='profile2.html'