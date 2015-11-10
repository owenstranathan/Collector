# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Collectable',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('name', models.CharField(max_length=100, default='Unamed Collectable')),
                ('image', models.ImageField(upload_to='')),
                ('description', models.CharField(blank=True, max_length=100, default='')),
                ('created', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Collection',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('name', models.CharField(max_length=100, default='Unamed Colletion')),
                ('description', models.CharField(blank=True, max_length=100, default='')),
                ('created', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.CreateModel(
            name='Collector',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('image', models.ImageField(upload_to='')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('user', models.OneToOneField(to=settings.AUTH_USER_MODEL, related_name='collector')),
            ],
        ),
        migrations.CreateModel(
            name='Topic',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('name', models.CharField(max_length='100')),
            ],
        ),
        migrations.AddField(
            model_name='collection',
            name='owner',
            field=models.ForeignKey(to='RESTservice.Collector', related_name='collections'),
        ),
        migrations.AddField(
            model_name='collection',
            name='topic',
            field=models.ForeignKey(to='RESTservice.Topic', related_name='collections'),
        ),
        migrations.AddField(
            model_name='collectable',
            name='collection',
            field=models.ForeignKey(to='RESTservice.Collection', related_name='collectables'),
        ),
        migrations.AddField(
            model_name='collectable',
            name='created_by',
            field=models.ForeignKey(to='RESTservice.Collector'),
        ),
    ]
