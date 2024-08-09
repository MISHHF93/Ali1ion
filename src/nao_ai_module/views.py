from django.shortcuts import render
from django.http import JsonResponse
from .nao_ai_app.nao_ai_functions import generate_text, generate_image

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
