from django.shortcuts import render
from django.http import JsonResponse
from .ali1ion_functions import generate_text, generate_image, create_embedding  # Import Ali1ion functions

def home(request):
    """
    Renders the home page.
    """
    return render(request, 'home.html')

def generate_text_view(request):
    """
    Handles text generation requests.
    """
    if request.method == 'POST':
        prompt = request.POST.get('prompt', '')
        generated_text = generate_text(prompt)
        return JsonResponse({'generated_text': generated_text})
    return render(request, 'generate_text.html')

def generate_image_view(request):
    """
    Handles image generation requests.
    """
    if request.method == 'POST':
        prompt = request.POST.get('prompt', '')
        size = request.POST.get('size', '1024x1024')  # Default size set to 1024x1024
        generated_image_url = generate_image(prompt, size)
        return JsonResponse({'generated_image_url': generated_image_url})
    return render(request, 'generate_image.html')

def transcribe_audio(request):
    """
    Handles audio transcription requests.
    """
    if request.method == 'POST':
        return JsonResponse({'transcribed_text': 'Audio transcription will be implemented here.'})
    return JsonResponse({'error': 'Invalid request method. Use POST to transcribe audio.'})

def synthesize_speech_basic(request):
    """
    Handles basic speech synthesis requests.
    """
    if request.method == 'POST':
        text_to_synthesize = request.POST.get('text', '')
        synthesized_audio_url = "http://example.com/basic_synthesized_audio.mp3"  # Placeholder URL
        return JsonResponse({'audio_url': synthesized_audio_url})
    return JsonResponse({'error': 'Invalid request method'}, status=400)

def synthesize_speech_hd(request):
    """
    Handles HD speech synthesis requests.
    """
    if request.method == 'POST':
        text_to_synthesize = request.POST.get('text', '')
        synthesized_audio_url = "http://example.com/hd_synthesized_audio.mp3"  # Placeholder URL
        return JsonResponse({'audio_url': synthesized_audio_url})
    return JsonResponse({'error': 'Invalid request method'}, status=400)

def create_embedding(request):
    """
    Handles embedding creation requests.
    """
    if request.method == 'POST':
        text = request.POST.get('text', '')
        embedding = create_embedding(text)
        return JsonResponse({'embedding': embedding})
    return JsonResponse({'error': 'Invalid request method. Use POST to create embedding.'})

def ali1ion_response(request):
    """
    Handles requests from the Ali1ion widget.
    """
    if request.method == 'POST':
        action = request.POST.get('action', '')

        if action == 'generate_text':
            prompt = request.POST.get('prompt', '')
            generated_text = generate_text(prompt)
            return JsonResponse({'status': 'success', 'generated_text': generated_text})

        elif action == 'generate_image':
            prompt = request.POST.get('prompt', '')
            size = request.POST.get('size', '1024x1024')
            generated_image_url = generate_image(prompt, size)
            return JsonResponse({'status': 'success', 'generated_image_url': generated_image_url})

        elif action == 'create_embedding':
            text = request.POST.get('text', '')
            embedding = create_embedding(text)
            return JsonResponse({'status': 'success', 'embedding': embedding})

        else:
            return JsonResponse({'status': 'error', 'message': 'Invalid action specified.'}, status=400)

    return JsonResponse({'status': 'error', 'message': 'Invalid request method. Use POST.'}, status=400)

def widget_view(request):
    """
    Renders the Ali1ion widget page.
    """
    return render(request, 'widget/index.html')
