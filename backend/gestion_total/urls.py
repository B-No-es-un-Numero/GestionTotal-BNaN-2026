from django.contrib import admin
from django.urls import include, path

urlpatterns = [ path('admin/', admin.site.urls),
               path('api/', include('client_app.urls')), 
               path('api/', include('company_app.urls')), 
               path('api/', include('user_app.urls')),
               path('api/', include('task_app.urls')),
               path('api/auth/', include('users.urls')),]

