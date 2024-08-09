# /home/mishari_borah/nao_ai_project/src/nao_ai_module/apps.py

from django.apps import AppConfig

class NaoAiModuleConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'nao_ai_module'
    verbose_name = 'NAO AI Module'

    def ready(self):
        import nao_ai_module.signals  # Import signals if any
