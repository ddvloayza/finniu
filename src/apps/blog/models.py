from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
from apps.core.models import CoreTimeModel, CoreActiveModel
from django.utils.translation import gettext as _
from tinymce_4.fields import TinyMCEModelField


class ConfigBlog(CoreTimeModel):

    user = models.ForeignKey(
        User,
        verbose_name=_('Usuario'),
        on_delete=models.PROTECT,
        related_name='user_config_blog',
        null=True
    )

    name_page = models.CharField(
        verbose_name=_('Nombre de la Pagina'),
        max_length=128
    )

    image = models.ImageField(
        verbose_name=_('Imagen'),
        upload_to='slider-blog-image/'
    )

    content = TinyMCEModelField(
        verbose_name=_('Descripccion de la pagina'),
        blank=True,
        null=True
    )

    def __str__(self):
        return "{}".format(self.name_page)

    class Meta:
        verbose_name = _("Blog configuracion")
        verbose_name_plural = _("blogs Configuraciones")


class CategoryArticle(CoreTimeModel):

    user = models.ForeignKey(
        User,
        verbose_name=_('Usuario'),
        on_delete=models.PROTECT,
        related_name='user_category',
        null=True
    )

    title = models.CharField(
        verbose_name=_('Título'),
        max_length=128
    )

    slug = models.SlugField(
        verbose_name=_('Slug'),
        max_length=128
    )

    image = models.ImageField(
        verbose_name=_('Imagen'),
        upload_to='blog-images/'
    )

    video = models.TextField(
        verbose_name=_('Video'),
        blank=True,
        null=True
    )

    highlighting_weight = models.PositiveIntegerField(
        verbose_name=_("Peso relativo de destaque"),
        default=100
    )

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = _("Categoria")
        verbose_name_plural = _("Categorias")


class BlogArticle(CoreTimeModel, CoreActiveModel):

    user = models.ForeignKey(
        User,
        verbose_name=_('Usuario'),
        on_delete=models.PROTECT,
        related_name='user_articles',
        null=True
    )
    category = models.ForeignKey(
        CategoryArticle,
        verbose_name=_('Categoria'),
        on_delete=models.PROTECT,
        related_name='category_article',
        null=True
    )

    title = models.CharField(
        verbose_name=_('Título'),
        max_length=128
    )

    slug = models.SlugField(
        verbose_name=_('Slug'),
        max_length=128
    )

    video = models.TextField(
        verbose_name=_('Video'),
        blank=True,
        null=True
    )

    highlighting_weight = models.PositiveIntegerField(
        verbose_name=_("Peso relativo de destaque"),
        default=100
    )

    intro = TinyMCEModelField(
        verbose_name=_('Introduccion'),
        blank=True,
        null=True
    )

    image_intro = models.ImageField(
        verbose_name=_('Imagen de Introduccion'),
        upload_to='blog-images/intro/',
        blank=True,
        null=True
    )

    quotes = TinyMCEModelField(
        verbose_name=_('Quotes'),
        blank=True,
        null=True
    )

    tags = models.ManyToManyField(
        'BlogTag',
        blank=True
    )

    def __str__(self):
        return "{}".format(self.title)

    class Meta:
        verbose_name = _("Artículo")
        verbose_name_plural = _("Artículos")

    def get_absolute_url(self):
        if self.slug:
            return reverse('blog:blog_detail', kwargs={
                'slug': self.slug
            })
        return ''


class BlogTag(CoreTimeModel):

    user = models.ForeignKey(
        User,
        verbose_name=_('Usuario'),
        on_delete=models.PROTECT,
        related_name='user_tag',
        null=True
    )

    name = models.CharField(
        verbose_name=_('Nombre'),
        max_length=128
    )

    slug = models.SlugField(
        verbose_name=_('Slug'),
        max_length=128,
        unique=False
    )

    color = models.PositiveIntegerField(
        verbose_name=_('Color'),
        null=True,
        blank=True
    )

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = _("Etiqueta de articulo")
        verbose_name_plural = _("Etiquetas de los articulos")

