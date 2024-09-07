# /workspaces/NAO-AI/src/nao_ai_module/apps.py

from django.apps import AppConfig

class NaoAiModuleConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'nao_ai_module'
    verbose_name = 'NAO AI Module'

    def ready(self):
        try:
            import nao_ai_module.signals  # Import signals if any
        except ImportError:
            pass  # Ignore the error if signals module does not exist
