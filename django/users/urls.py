from django.urls import path
from .views import AdmissionView,ProfileView,AlterProfileView

urlpatterns=[
    path('admissions/',AdmissionView.as_view(),name='admissions'),
    path('profile/<int:pk>',ProfileView.as_view(),name='profile'),
    path('profile2/',AlterProfileView.as_view(),name='profile2')
]