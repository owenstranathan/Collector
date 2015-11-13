from django.shortcuts import render
from django.contrib.auth.models import User
from RESTservice.serializers import UserSerializer, TopicSerializer, CollectorSerializer, CollectionSerializer, CollectableSerializer

from RESTservice.models import Topic, Collector, Collection, Collectable
from rest_framework import generics, permissions, mixins
from rest_framework.decorators import detail_route, api_view
from rest_framework.response import Response
from rest_framework import renderers
from rest_framework import viewsets

#
# from rest_framework import mixins
# from rest_framework import generics
#
# class UserDetail(mixins.RetrieveModelMixin,
#                     mixins.UpdateModelMixin,
#                     mixins.DestroyModelMixin,
#                     generics.GenericAPIView):
#
#     queryset = User.objects.all()
#     lookup_field = "username"
#     serializer_class = UserSerializer
#
#
#     # def get(self, request, username, format=None):
#     #     try:
#     #         user = User.objects.get(username=username)
#     #     except User.DoesNotExist:
#     #         raise Http404
#     #     serializer = UserSerializer(user)
#     #     return Response(serializer.data)
#
#     def get(self, request, *args, **kwargs):
#         return self.retrieve(request, *args, **kwargs)
#
#     def put(self, request, *args, **kwargs):
#         return self.update(request, *args, **kwargs)
#
#     def delete(self, request, *args, **kwargs):
#         return self.destroy(request, *args, **kwargs)
#
# class UserList(generics.ListCreateAPIView):
#     queryset = User.objects.all()
#     serializer_class = UserSerializer
#
#
#
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

    permission_classes = ( permissions.IsAuthenticatedOrReadOnly, )



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
