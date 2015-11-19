from rest_framework import serializers
from .models import Topic, Collector, Collection, Collectable
from django.contrib.auth.models import User

class UserSerializer(serializers.ModelSerializer):
    # collector = serializers.ModelField(model_field=Collector()._meta.get_field('id'))
    class Meta:
        model = User
        lookup_field = "username"
        fields = ('id', 'username', 'email', 'password')

    def create(self, validated_data):
        user = User(**validated_data)
        user.save()
        collector = Collector(user=user)
        collector.save()
        return user

class CollectorSerializer(serializers.ModelSerializer):
    # user = serializers.HyperlinkedRelatedField(
    #     view_name='user-detail',
    #     read_only=True,
    #     lookup_field='username'
    # )
    class Meta:
        model = Collector
        lookup_field = "username"
        fields = ('user', 'id', 'image', 'likes')

class CollectionSerializer(serializers.ModelSerializer):
    # owner  = serializers.ReadOnlyField(source='owner.username')
    # topic = serializers.ReadOnlyField(source='topic.name')
    class Meta:
        model = Collection
        lookup_field = "name"
        fields = ('id', 'name', 'owner', 'likes', 'description', 'topic')

class CollectableSerializer(serializers.ModelSerializer):
    # collection = serializers.ReadOnlyField(source='collection.name')
    # created_by = serializers.ReadOnlyField(source='created_by.username')
    image = serializers.ImageField(use_url=True)
    class Meta:
        model = Collectable
        lookup_field = 'name'
        fields = ('id', 'name', 'image', 'likes', 'description', 'collection', 'created_by')


class TopicSerializer(serializers.ModelSerializer):
    class Meta:
        model = Topic
        lookup_field = 'name'
        fields = ('name',)
