from django.contrib import admin
from apps.blog import models


@admin.register(models.BlogArticle)
class BlogArticleAdmin(admin.ModelAdmin):
    list_display = ['user', 'title', 'slug']
    prepopulated_fields = {"slug": ("title",)}
    

@admin.register(models.BlogTag)
class BlogTagAdmin(admin.ModelAdmin):
    list_display = ['user', 'name', 'slug']
    prepopulated_fields = {"slug": ("name",)}


@admin.register(models.CategoryArticle)
class CategoryArticleAdmin(admin.ModelAdmin):
    list_display = ['user', 'title', 'slug']
    prepopulated_fields = {"slug": ("title",)}

@admin.register(models.ConfigBlog)
class ConfigBlogAdmin(admin.ModelAdmin):
    list_display = ['user', 'name_page']



