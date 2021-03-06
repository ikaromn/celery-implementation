from django.http import JsonResponse
from leads.models import Lead
from leads.serializers import LeadSerializer
from rest_framework import views
from rest_framework import generics
from .tasks import create_random_user_accounts


class LeadListCreate(generics.ListCreateAPIView):
    queryset = Lead.objects.all()
    serializer_class = LeadSerializer


class SimplePostView(views.APIView):

    def post(self, request, **kwargs):

        create_random_user_accounts.delay(request.data['total'])

        return JsonResponse({"hello": "World"})
