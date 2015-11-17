from django.shortcuts import render
from django.contrib.auth.models import User
from RESTservice.serializers import UserSerializer, TopicSerializer, CollectorSerializer, CollectionSerializer, CollectableSerializer

from RESTservice.models import Topic, Collector, Collection, Collectable
from rest_framework import generics, permissions, mixins
from rest_framework.decorators import detail_route, api_view
from rest_framework.response import Response
from rest_framework import renderers
from rest_framework import viewsets


"""Create, List and Retrieve TOPICViewSet"""
class TopicViewSet(mixins.CreateModelMixin,
                   mixins.ListModelMixin,
                   mixins.RetrieveModelMixin,
                   viewsets.GenericViewSet):
    """
    This viewset automatically provides `list`, `create`, `retrieve`,
    `update` and `destroy` actions.
    """
    queryset = Topic.objects.all()
    lookup_field = 'name'
    serializer_class = TopicSerializer


"""Create, List, Retrieve, Update and Destory USERViewSet"""
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    lookup_field = 'username'
    serializer_class = UserSerializer

    # permission_classes = ( permissions.IsAuthenticatedOrReadOnly, )



"""Create, List, Retrieve, Update and Destory COLLECTORViewSet"""
class CollectorViewSet(viewsets.ModelViewSet):
    queryset = Collector.objects.all()
    lookup_field = 'username'
    serializer_class = CollectorSerializer


"""Create, List, Retrieve, Update and Destory COLLECTIONViewSet"""
class CollectionViewSet(viewsets.ModelViewSet):
    queryset = Collection.objects.all()
    lookup_field = 'name'
    serializer_class = CollectionSerializer


"""Create, List, Retrieve, Update and Destory COLLECTABLEViewSet"""
class CollectableViewSet(viewsets.ModelViewSet):
    queryset = Collectable.objects.all()
    lookup_field = 'name'
    serializer_class = CollectableSerializer
