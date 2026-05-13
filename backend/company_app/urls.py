from django.urls import path
from .views import CompanyView
urlpatterns = [
    path('companias/', CompanyView.as_view()),
    path('companias/<int:pk>/', CompanyView.as_view()),
]