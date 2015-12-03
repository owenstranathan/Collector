# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('RESTservice', '0005_auto_20151117_1933'),
    ]

    operations = [
        migrations.AddField(
            model_name='collectable',
            name='likes',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='collection',
            name='likes',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='collector',
            name='likes',
            field=models.IntegerField(default=0),
        ),
    ]
