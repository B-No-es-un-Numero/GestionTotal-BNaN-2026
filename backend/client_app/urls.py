from django.urls import path
from .views import ClientView

urlpatterns = [ path('clientes', ClientView.as_view()),
               path('clientes/<int:pk>/', ClientView.as_view()),
               ]