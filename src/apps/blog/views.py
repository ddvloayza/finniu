import json
from django.shortcuts import render
from django.http.response import JsonResponse, HttpResponse
from django.views.generic import TemplateView, ListView, DetailView
from apps.blog.models import BlogArticle, CategoryArticle, BlogTag, ConfigBlog
from django.shortcuts import get_object_or_404


class HomeView(TemplateView):

    template_name = 'index.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        lists_articles = BlogArticle.objects.all()

        context.update(
            {
                "lists_articles": lists_articles,
            }
        )
        return context


class BlogDetailView(DetailView):
    queryset = BlogArticle.objects.all()
    template_name = 'single-blog.html'

    def get_context_data(self, **kwargs):
        article = BlogArticle.objects.get(slug=self.kwargs["slug"])
        context = super().get_context_data(**kwargs)
        context.update(
            {
                "article": article,
            }
        )
        return context


class MethodVignere(TemplateView):
    template_name = 'metodo-vignere.html'

    