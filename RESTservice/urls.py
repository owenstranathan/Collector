from django.conf.urls import url, include
from rest_framework.routers import DefaultRouter
from rest_framework.urlpatterns import format_suffix_patterns
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
    url(r'^collectors/(?P<collector_name>.+)/image/$', views.CollectorImageView, name='collector_image_view'),
    url(r'^collectables/(?P<collectable_name>.+)/image/$', views.CollectableImageView, name='collectable_image_view')
]

# urlpatterns = format_suffix_patterns(urlpatterns)
# urlpatterns += [
#     url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
# ]
