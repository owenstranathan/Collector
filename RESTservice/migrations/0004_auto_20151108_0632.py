# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('RESTservice', '0003_auto_20151108_0617'),
    ]

    operations = [
        migrations.AlterField(
            model_name='topic',
            name='name',
            field=models.CharField(unique=True, max_length=100),
        ),
    ]
