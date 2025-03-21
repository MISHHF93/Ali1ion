from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),  # Home page route
    path('transcribe/', views.transcribe_audio, name='transcribe_audio'),  # Transcribe audio route
    path('synthesize_basic/', views.synthesize_speech_basic, name='synthesize_speech_basic'),  # Basic speech synthesis route
    path('synthesize_hd/', views.synthesize_speech_hd, name='synthesize_speech_hd'),  # HD speech synthesis route
    path('generate_image/', views.generate_image_view, name='generate_image'),  # Generate image route
    path('generate_text/', views.generate_text_view, name='generate_text'),  # Generate text route
    path('create_embedding/', views.create_embedding, name='create_embedding'),  # Create embedding route

    # Route for Ali1ion widget interaction
    path('ali1ion-response/', views.ali1ion_response, name='ali1ion-response'),  # Ali1ion model response for the widget

    # Route for rendering the widget interface
    path('widget/', views.widget_view, name='widget'),  # Widget rendering route
]
