from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('transcribe/', views.transcribe_audio, name='transcribe_audio'),
    path('synthesize_basic/', views.synthesize_speech_basic, name='synthesize_speech_basic'),
    path('synthesize_hd/', views.synthesize_speech_hd, name='synthesize_speech_hd'),
    path('generate_image/', views.generate_image, name='generate_image'),
    path('generate_text/', views.generate_text, name='generate_text'),
    path('create_embedding/', views.create_embedding, name='create_embedding'),
]
