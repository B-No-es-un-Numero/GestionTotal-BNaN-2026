from rest_framework import serializers
from task_app.models import Task


class TaskSerializer(serializers.ModelSerializer):

    class Meta:
        model = Task
        fields = '__all__'
        read_only_fields = [
            'id',
            'created_at',
            'updated_at'
        ]