from django.contrib import admin
from apps.userprofile import models


@admin.register(models.UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ['user', 'first_name', 'last_name']
    prepopulated_fields = {"slug": ("first_name",)}
    
