# /home/mishari_borah/ali1ion_project/src/ali1ion_module/admin.py

from django.contrib import admin
from .models import NaoAiModel

@admin.register(NaoAiModel)
class NaoAiAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'description', 'status', 'created_at', 'updated_at')
    search_fields = ('name', 'description')
    list_filter = ('status', 'created_at')
    ordering = ('-created_at',)
    readonly_fields = ('created_at', 'updated_at')
    fieldsets = (
        (None, {
            'fields': ('name', 'description', 'status')
        }),
        ('Timestamps', {
            'fields': ('created_at', 'updated_at')
        }),
    )
    list_per_page = 25
