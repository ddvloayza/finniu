from django.shortcuts import render
from apps.blog.models import (BlogArticle, ConfigBlog)


def lastest_posts(request):
    last_articles = BlogArticle.objects.all()[:3]
    return {
            'last_articles': last_articles,
        }

def config_blog(request):
    blog_config = ConfigBlog.objects.first()
    return {
            "blog_config": blog_config
    }
