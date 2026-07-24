from django.shortcuts import render

from .models import Pillar


# Create your views here.
def index(request):
    context = {"pillar_list": Pillar.objects.all()}
    return render(request, "index.html", context)
