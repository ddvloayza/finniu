# Generated by Django 3.0.8 on 2021-06-28 00:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0006_blogarticle_quotes'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='blogarticle',
            name='first_p',
        ),
        migrations.RemoveField(
            model_name='blogarticle',
            name='image_primary',
        ),
        migrations.AddField(
            model_name='blogarticle',
            name='is_active',
            field=models.BooleanField(default=True, verbose_name='is active'),
        ),
    ]
