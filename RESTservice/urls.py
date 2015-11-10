from django.conf.urls import url, include
from rest_framework.routers import DefaultRouter
from RESTservice import views
#
# # Create a router and register our viewsets with it
router = DefaultRouter()
router.register(r'topics', views.TopicViewSet)
router.register(r'users', views.UserViewSet)
router.register(r'collectors', views.CollectorViewSet)
router.register(r'collections', views.CollectionViewSet)
router.register(r'collectables', views.CollectableViewSet)
#
urlpatterns = [
    # The auto made url patterns for my models
    url(r'^', include(router.urls)),
]
