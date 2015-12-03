# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('RESTservice', '0004_auto_20151108_0632'),
    ]

    operations = [
        migrations.AlterField(
            model_name='collector',
            name='image',
            field=models.ImageField(upload_to='', null=True),
        ),
    ]
