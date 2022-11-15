from django.urls import path
from .views import login


app_name = 'blog'

urlpatterns = [
    path('login/',
         login,
         name='login_user'),


]
