from django.shortcuts import render
from django.http import JsonResponse
from .nao_ai_app.nao_ai_functions import generate_text, generate_image

def home(request):
    return render(request, 'home.html')

def generate_text_view(request):
    if request.method == 'POST':
        prompt = request.POST.get('prompt', '')
        generated_text = generate_text(prompt)
        return JsonResponse({'generated_text': generated_text})
    return render(request, 'generate_text.html')

def generate_image_view(request):
    if request.method == 'POST':
        prompt = request.POST.get('prompt', '')
        size = request.POST.get('size', '1024x1024')
        generated_image_url = generate_image(prompt, size)
        return JsonResponse({'generated_image_url': generated_image_url})
    return render(request, 'generate_image.html')
