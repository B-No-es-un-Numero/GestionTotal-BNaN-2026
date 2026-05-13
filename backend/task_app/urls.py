from django.urls import path
from task_app.views import TaskView

urlpatterns = [
    path('tareas/', TaskView.as_view(), name='task-list-create'),
    path('tareas/<int:pk>/', TaskView.as_view(), name='task-detail'),
]