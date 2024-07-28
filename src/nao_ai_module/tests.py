from django.test import TestCase
from .models import ExampleModel
from .nao_ai_app.nao_ai_functions import transcribe_audio, synthesize_speech_basic, synthesize_speech_hd, generate_image, generate_text, create_embedding

class ExampleModelTest(TestCase):
    def setUp(self):
        ExampleModel.objects.create(name="Test", description="This is a test description")

    def test_example_model_creation(self):
        test_obj = ExampleModel.objects.get(name="Test")
        self.assertEqual(test_obj.description, "This is a test description")

class NaoAiFunctionsTest(TestCase):
    def test_transcribe_audio(self):
        result = transcribe_audio("path/to/audio/file")
        self.assertEqual(result, "Transcribed text")

    def test_synthesize_speech_basic(self):
        result = synthesize_speech_basic("Hello, World!")
        self.assertEqual(result, "URL to basic synthesized speech")

    def test_synthesize_speech_hd(self):
        result = synthesize_speech_hd("Hello, World!")
        self.assertEqual(result, "URL to HD synthesized speech")

    def test_generate_image(self):
        result = generate_image("A beautiful landscape")
        self.assertEqual(result, "URL to generated image")

    def test_generate_text(self):
        result = generate_text("Tell me a joke")
        self.assertEqual(result, "Generated text")

    def test_create_embedding(self):
        result = create_embedding("Hello, World!")
        self.assertEqual(result, "Generated embedding")
