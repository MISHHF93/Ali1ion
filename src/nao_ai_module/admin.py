# /home/mishari_borah/nao_ai_project/src/nao_ai_module/admin.py

from django.contrib import admin
from .models import NaoAiModel

@admin.register(NaoAiModel)
class NaoAiAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'description', 'created_at')
    search_fields = ('name', 'description')
    list_filter = ('created_at',)
