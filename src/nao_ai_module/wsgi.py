"""
WSGI config for nao_ai_module project.

This file exposes the WSGI callable as a module-level variable named ``application``.
This is the entry point for WSGI-compatible web servers to serve your project.

For more information on this file, see
https://docs.djangoproject.com/en/stable/howto/deployment/wsgi/
"""

import os
from django.core.wsgi import get_wsgi_application

# Set the default settings module for the 'nao_ai_module' project.
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'nao_ai_module.settings')

# Get the WSGI application for use by the server.
application = get_wsgi_application()
