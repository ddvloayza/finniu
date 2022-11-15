from django.urls import path
from .viewsets import BlogArticleViewsets, MethoVignereView


urlpatterns = [
    path("api-blog", BlogArticleViewsets.as_view(), name="api_blog"),
    path("method-vignere", MethoVignereView.as_view(), name="method_vignere"),
]
