# Generated by Django 3.0.6 on 2021-04-18 04:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_auto_20210417_2308'),
    ]

    operations = [
        migrations.AddField(
            model_name='blogarticle',
            name='image_primary',
            field=models.ImageField(blank=True, null=True, upload_to='blog-images/primary/', verbose_name='Imagen Primaria'),
        ),
        migrations.AddField(
            model_name='blogarticle',
            name='image_secondary',
            field=models.ImageField(blank=True, null=True, upload_to='blog-images/secondary/', verbose_name='Imagen Secundaria'),
        ),
        migrations.AlterField(
            model_name='blogarticle',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='blog-images/', verbose_name='Imagen de Introduccion'),
        ),
    ]
