from django.db import models
from django.contrib.auth.models import User

class Topic(models.Model):
    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name

"""A Relational Extension of the User Model"""
class Collector(models.Model):
    user = models.OneToOneField(User, related_name='collector')
    image = models.ImageField(null=True)
    created = models.DateTimeField(auto_now_add=True)
    likes = models.IntegerField(blank=False, null=False, default=0)

    def __str__(self):
        return self.user.username

    @property
    def user__username(self):
        return self.user.username

    @property
    def email(self):
        return self.user.email

    @property
    def password(self):
        return self.user.password

    class Meta:
        ordering =("user",)


class Collection(models.Model):
    name = models.CharField(max_length=100, default="Unamed Colletion")
    owner = models.ForeignKey(Collector, related_name='collections')
    description = models.CharField(max_length=100, blank=True, default="")
    topic = models.ForeignKey(Topic, related_name='collections')
    created = models.DateTimeField(auto_now_add=True)
    likes = models.IntegerField(blank=False, null=False, default=0)

    def __str__(self):
        return self.name


class Collectable(models.Model):
    name = models.CharField(max_length=100, default="Unamed Collectable")
    image = models.ImageField()
    description = models.CharField(max_length=100, blank=True, default="")
    collection = models.ForeignKey(Collection, related_name='collectables')
    created = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(Collector)
    likes = models.IntegerField(blank=False, null=False, default=0)

    def __str__(self):
        return self.name
