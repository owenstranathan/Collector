from rest_framework import serializers
from .models import Topic, Collector, Collection, Collectable
from django.contrib.auth.models import User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        collector = serializers.StringRelatedField()
        lookup_field = "username"
        fields = ('id', 'username', 'email', 'password', 'collector')

class CollectorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Collector
        user = serializers.StringRelatedField()
        lookup_field = "username"
        fields = ('username', 'id', 'user', 'image')

class CollectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Collection
        lookup_field = 'name'
        fields = ('id', 'name', 'owner', 'description', 'topic')

class CollectableSerializer(serializers.ModelSerializer):
    class Meta:
        model = Collectable
        lookup_field = 'name'
        fields = ('id', 'name', 'image', 'description', 'collection', 'created_by')

class TopicSerializer(serializers.ModelSerializer):
    class Meta:
        model = Topic
        lookup_field = 'name'
        fields = ('name',)
