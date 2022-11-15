from django.db import models
from django.utils.translation import gettext as _

from .managers import RemovedManager, ActiveManager


class CoreTimeModel(models.Model):
    """ Modelo Base"""
    created = models.DateTimeField(_('created'), auto_now_add=True)
    modified = models.DateTimeField(_('modified'), auto_now=True)

    class Meta:
        abstract = True


class CoreActiveModel(models.Model):
    """Modelo Activo"""
    is_active = models.BooleanField(_('is active'), default=True)
    objects = models.Manager()
    active = ActiveManager()

    class Meta:
        abstract = True


class CorePositionModel(models.Model):
    """Modelo Posicion"""
    position = models.IntegerField(_('Position'), default=1)

    class Meta:
        verbose_name = "CorePositionModel"
        verbose_name_plural = "CorePositionModels"
        abstract = True
        ordering = ['position']


class RemovedModel(models.Model):
    is_removed = models.BooleanField(default=False)
    remove_objects = RemovedManager()

    class Meta:
        verbose_name = "Delete Model"
        verbose_name_plural = "Delete Models"
        abstract = True

    def __str__(self):
        pass
