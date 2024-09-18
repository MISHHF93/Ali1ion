// WebSocket-based GPT-4o interaction script

const socket = new WebSocket('ws://localhost:8000/ws/gpt4o/');

document.addEventListener('DOMContentLoaded', function() {
    const gptForm = document.querySelector('#gpt-form');
    const gptResult = document.querySelector('#gpt-result');

    if (gptForm) {
        gptForm.addEventListener('submit', function(event) {
            event.preventDefault();
            const formData = new FormData(gptForm);
            const prompt = formData.get('prompt');

            // Send prompt via WebSocket
            socket.send(JSON.stringify({ prompt }));

            socket.onmessage = function(event) {
                const data = JSON.parse(event.data);
                gptResult.innerHTML = data.result;
            };

            socket.onerror = function(error) {
                console.error('WebSocket Error:', error);
                gptResult.innerHTML = "Error processing WebSocket response.";
            };
        });
    }
});
