from django.shortcuts import render
from django.contrib.auth.models import User
from RESTservice.serializers import UserSerializer, TopicSerializer, CollectorSerializer, CollectionSerializer, CollectableSerializer

from RESTservice.models import Topic, Collector, Collection, Collectable
from rest_framework import generics, permissions, mixins
from rest_framework.decorators import detail_route, api_view
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import renderers
from rest_framework import viewsets, status

from django.http import HttpResponse


def CollectorImageView(request, collector_name):
    user_id = User.objects.get(username=collector_name).id
    image = Collector.objects.get(user_id=user_id).image
    return HttpResponse(image, content_type="image/png")

def CollectableImageView(request, collectable_name):
    image = Collectable.objects.get(name=collectable_name).image
    return HttpResponse(image, content_type="image/png")

"""Create, List and Retrieve TOPICViewSet"""
class TopicViewSet(mixins.CreateModelMixin,
                   mixins.ListModelMixin,
                   mixins.RetrieveModelMixin,
                   mixins.DestroyModelMixin,
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
    lookup_field = 'user__username'
    serializer_class = CollectorSerializer


"""Create, List, Retrieve, Update and Destory COLLECTIONViewSet"""
class CollectionViewSet(viewsets.ModelViewSet):
    queryset = Collection.objects.all()
    lookup_field = 'name'
    serializer_class = CollectionSerializer


"""Create, List, Retrieve, Update and Destory COLLECTABLEViewSet"""
class CollectableViewSet(viewsets.ModelViewSet):
    queryset = Collectable.objects.all()
    lookup_field = 'id'
    serializer_class = CollectableSerializer
