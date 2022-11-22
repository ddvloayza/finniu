from django.urls import path
from .views import HomeView, ServicesView
from apps.core.views import Error404View

app_name = 'blog'

urlpatterns = [

    path('', HomeView.as_view(), name='home'),
    path('servicios/',
         ServicesView.as_view(),
         name='servicios'),
    path('404/',
         Error404View.as_view(),
         name='error-404'),

]
