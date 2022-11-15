from .models import BlogArticle
from rest_framework import serializers


class BlogArticleSerializer(serializers.ModelSerializer):
    url = serializers.SerializerMethodField()
    date = serializers.SerializerMethodField()
    category = serializers.SerializerMethodField()
    user = serializers.SerializerMethodField()

    class Meta:
        model = BlogArticle
        fields = ['is_active', 'date',
                  'url', 'user', 'category',
                  'title', 'slug', 'video',
                  'highlighting_weight',
                  'intro', 'image_intro',
                  'quotes', 'tags']

    def get_url(self, obj):
        return obj.get_absolute_url()

    def get_date(self, obj):
        date = obj.created.strftime("%m/%d/%Y, %H:%M:%S")
        return date

    def get_category(self, obj):
        return obj.category.id, obj.category.title

    def get_user(self, obj):
        return obj.user.id, obj.user.first_name + ' ' + obj.user.last_name
