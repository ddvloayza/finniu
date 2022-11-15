from django.urls import path
from .views import HomeView, BlogDetailView, MethodVignere
from apps.core.views import Error404View

app_name = 'blog'

urlpatterns = [

    path('', HomeView.as_view(), name='home'),
    path('blog/<slug:slug>/detail/',
         BlogDetailView.as_view(),
         name='blog_detail'),
    path('blog/404/',
         Error404View.as_view(),
         name='error-404'),
    path('method-vignere/',
         MethodVignere.as_view(),
         name='method_vignere'),

]
