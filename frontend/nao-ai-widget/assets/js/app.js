// Show Loader
function showLoader(element) {
    element.innerHTML = 'Loading...';
    element.disabled = true;  // Disable the button during the request
}

// Hide Loader
function hideLoader(element, originalText) {
    element.innerHTML = originalText;
    element.disabled = false;  // Re-enable the button after the request is complete
}

// Show Error Message
function showError(element, message) {
    element.innerHTML = `<div class="alert alert-danger">${message}</div>`;
}

// Handle Text Generation
document.getElementById('generate-text').addEventListener('click', async () => {
    const prompt = document.getElementById('text-input').value.trim();
    const outputElement = document.getElementById('text-output');
    const button = document.getElementById('generate-text');
    
    // Clear previous output or error messages
    outputElement.innerText = '';

    if (!prompt) {
        showError(outputElement, 'Please enter a valid text prompt.');
        return;
    }

    showLoader(button);

    try {
        const response = await fetch('http://localhost:8000/api/generate', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ prompt }),
        });

        if (!response.ok) {
            throw new Error('Failed to generate text.');
        }

        const data = await response.json();
        outputElement.innerText = data.response;
    } catch (error) {
        showError(outputElement, error.message || 'Error generating text.');
    } finally {
        hideLoader(button, 'Generate Text');
    }
});

// Handle Image Generation
document.getElementById('generate-image').addEventListener('click', async () => {
    const prompt = document.getElementById('image-input').value.trim();
    const imageElement = document.getElementById('generated-image');
    const outputElement = document.getElementById('image-output');
    const button = document.getElementById('generate-image');

    // Clear previous output or error messages
    imageElement.style.display = 'none';
    outputElement.innerText = '';

    if (!prompt) {
        showError(outputElement, 'Please enter a valid image prompt.');
        return;
    }

    showLoader(button);

    try {
        const response = await fetch('http://localhost:8000/api/generate-image', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ prompt }),
        });

        if (!response.ok) {
            throw new Error('Failed to generate image.');
        }

        const data = await response.json();
        imageElement.src = data.response; // URL from the API response
        imageElement.style.display = 'block';
    } catch (error) {
        showError(outputElement, error.message || 'Error generating image.');
    } finally {
        hideLoader(button, 'Generate Image');
    }
});
