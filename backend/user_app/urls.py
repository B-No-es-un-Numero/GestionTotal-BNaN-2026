from django.urls import path
from .views import UserView

urlpatterns = [ path('usuarios', UserView.as_view()),
                path('usuarios/<int:pk>/', UserView.as_view()),
                ]