// Handle Text Generation
document.getElementById('generate-text').addEventListener('click', async () => {
    const prompt = document.getElementById('text-input').value;

    const response = await fetch('http://localhost:5000/api/generate', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ prompt })
    });

    const data = await response.json();
    document.getElementById('text-output').innerText = data.response;
});

// Handle Image Generation
document.getElementById('generate-image').addEventListener('click', async () => {
    const prompt = document.getElementById('image-input').value;

    const response = await fetch('http://localhost:5000/api/generate-image', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ prompt })
    });

    const data = await response.json();
    const imageElement = document.getElementById('generated-image');
    imageElement.src = data.response;  // URL from the API response
    imageElement.style.display = 'block';
});
