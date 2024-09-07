from django.shortcuts import render
from django.http import JsonResponse
from .nao_ai_app.nao_ai_functions import generate_text, generate_image, create_embedding  # Corrected import

def home(request):
    """
    Renders the home page.
    """
    return render(request, 'home.html')

def generate_text_view(request):
    """
    Handles text generation requests.
    If the request method is POST, it retrieves the 'prompt' from the request,
    generates text using the generate_text function, and returns the result as JSON.
    Otherwise, it renders the text generation form page.
    """
    if request.method == 'POST':
        prompt = request.POST.get('prompt', '')
        generated_text = generate_text(prompt)
        return JsonResponse({'generated_text': generated_text})
    return render(request, 'generate_text.html')

def generate_image_view(request):
    """
    Handles image generation requests.
    If the request method is POST, it retrieves the 'prompt' and 'size' from the request,
    generates an image using the generate_image function, and returns the image URL as JSON.
    Otherwise, it renders the image generation form page.
    """
    if request.method == 'POST':
        prompt = request.POST.get('prompt', '')
        size = request.POST.get('size', '1024x1024')  # Default size is 1024x1024 if not provided
        generated_image_url = generate_image(prompt, size)
        return JsonResponse({'generated_image_url': generated_image_url})
    return render(request, 'generate_image.html')

def transcribe_audio(request):
    """
    Handles audio transcription requests.
    For now, this is a placeholder that returns a static message as a response.
    Later, you can integrate audio transcription logic here.
    """
    if request.method == 'POST':
        # Placeholder for audio transcription logic
        return JsonResponse({'transcribed_text': 'Audio transcription will be implemented here.'})
    return JsonResponse({'error': 'Invalid request method. Use POST to transcribe audio.'})

def synthesize_speech_basic(request):
    """
    Handles basic speech synthesis requests.
    This is a placeholder for basic speech synthesis logic.
    """
    if request.method == 'POST':
        text_to_synthesize = request.POST.get('text', '')
        synthesized_audio_url = "http://example.com/basic_synthesized_audio.mp3"  # Example URL
        return JsonResponse({'audio_url': synthesized_audio_url})
    return JsonResponse({'error': 'Invalid request method'}, status=400)

def synthesize_speech_hd(request):
    """
    Handles HD speech synthesis requests.
    This is a placeholder for HD speech synthesis logic.
    """
    if request.method == 'POST':
        text_to_synthesize = request.POST.get('text', '')
        synthesized_audio_url = "http://example.com/hd_synthesized_audio.mp3"  # Example URL
        return JsonResponse({'audio_url': synthesized_audio_url})
    return JsonResponse({'error': 'Invalid request method'}, status=400)

def create_embedding(request):
    """
    Handles embedding creation requests.
    For now, this is a placeholder that returns a static message as a response.
    Later, you can integrate the embedding creation logic here.
    """
    if request.method == 'POST':
        text = request.POST.get('text', '')
        embedding = create_embedding(text)  # Call to the embedding creation function
        return JsonResponse({'embedding': embedding})
    return JsonResponse({'error': 'Invalid request method. Use POST to create embedding.'})

def nao_ai_response(request):
    """
    Handles requests from the NAO-AI widget.
    This function processes requests sent by the widget and returns the relevant response
    such as generating text, images, or embeddings.
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
