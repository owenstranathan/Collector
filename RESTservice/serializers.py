from rest_framework import serializers
from .models import Topic, Collector, Collection, Collectable
from django.contrib.auth.models import User

class UserSerializer(serializers.ModelSerializer):
    collector = serializers.StringRelatedField()
    class Meta:
        model = User
        lookup_field = "username"
        fields = ('id', 'username', 'email', 'password', 'collector')

class CollectorSerializer(serializers.ModelSerializer):
    user = serializers.StringRelatedField()
    class Meta:
        model = Collector
        lookup_field = "username"
        fields = ('username', 'id', 'user', 'image')

class CollectionSerializer(serializers.ModelSerializer):
    owner  = serializers.ReadOnlyField(source='owner.username')
    topic = serializers.ReadOnlyField(source='topic.name')
    class Meta:
        model = Collection
        lookup_field = 'name'
        fields = ('id', 'name', 'owner', 'description', 'topic')

class CollectableSerializer(serializers.ModelSerializer):
    collection = serializers.ReadOnlyField(source='collection.name')
    created_by = serializers.ReadOnlyField(source='created_by.username')
    class Meta:
        model = Collectable
        lookup_field = 'name'
        fields = ('id', 'name', 'image', 'description', 'collection', 'created_by')

class TopicSerializer(serializers.ModelSerializer):
    class Meta:
        model = Topic
        lookup_field = 'name'
        fields = ('name',)
