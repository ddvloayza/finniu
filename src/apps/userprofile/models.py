from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
from apps.core.models import CoreTimeModel
from django.utils.translation import gettext as _
# Create your models here.

class UserProfile(CoreTimeModel):

    user = models.OneToOneField(
        User,
        verbose_name=_('Usuario'),
        on_delete=models.PROTECT,
        related_name='user_userprofile',
        null=True
    )

    first_name = models.CharField(
        verbose_name=_('Nombre'),
        max_length=128
    )

    last_name = models.CharField(
        verbose_name=_('Apellidos'),
        max_length=128
    )
    ocupation = models.CharField(
        verbose_name=_('Ocupacion/Cargo/Puesto/Trabajo'),
        max_length=128,
        null=True,
        blank=True
    )

    image = models.ImageField(
        verbose_name=_('Imagen_Usuario'),
        upload_to='userprofile-images/', 
        null=True
    )

    slug = models.SlugField(
        verbose_name=_('Slug'),
        max_length=128,
        unique=False
    )

    facebook_url = models.URLField(
        verbose_name=_('URL de cuenta en Facebook'),
        blank=True,
        null=True
    )

    linkedin_url = models.URLField(
        verbose_name=_('URL de cuenta en Linkedin'),
        blank=True,
        null=True
    )

    twitter_url = models.URLField(
        verbose_name=_('URL de cuenta en Twitter'),
        blank=True,
        null=True
    )

    instagram_url = models.URLField(
        verbose_name=_('URL de cuenta en instagram'),
        blank=True,
        null=True
    )

    def __str__(self):
        return self.first_name

    class Meta:
        verbose_name = _("Perfil del Usuario")
        verbose_name_plural = _("Perfiles de Usuarios")
