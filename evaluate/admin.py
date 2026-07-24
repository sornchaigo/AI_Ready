from django.contrib import admin

from .models import Choices, Pillar, Questions

# Register your models here.
admin.site.register(Pillar)
admin.site.register(Questions)
admin.site.register(Choices)
