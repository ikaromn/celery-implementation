from django.urls import path
from . import views
urlpatterns = [
    path('api/lead/', views.LeadListCreate.as_view()),
    path('api/celery/', views.SimplePostView.as_view()),
]