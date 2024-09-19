// WebSocket-based GPT-4o interaction script

let socket;
let isSocketOpen = false;

function connectWebSocket() {
    socket = new WebSocket('ws://localhost:8000/ws/gpt4o/');

    socket.onopen = function() {
        console.log("WebSocket connection established");
        isSocketOpen = true;
    };

    socket.onclose = function() {
        console.log("WebSocket connection closed, attempting to reconnect...");
        isSocketOpen = false;
        setTimeout(connectWebSocket, 1000);  // Retry connection after 1 second
    };

    socket.onerror = function(error) {
        console.error('WebSocket Error:', error);
        document.querySelector('#gpt-result').innerHTML = "Error connecting to WebSocket.";
    };
}

document.addEventListener('DOMContentLoaded', function() {
    const gptForm = document.querySelector('#gpt-form');
    const gptResult = document.querySelector('#gpt-result');
    const loadingIndicator = document.querySelector('#loading-indicator'); // For loading feedback

    // Initialize WebSocket connection
    connectWebSocket();

    if (gptForm) {
        gptForm.addEventListener('submit', function(event) {
            event.preventDefault();
            const formData = new FormData(gptForm);
            const prompt = formData.get('prompt').trim();

            // Clear previous result
            gptResult.innerHTML = '';
            
            // Input validation
            if (!prompt) {
                gptResult.innerHTML = 'Please enter a valid prompt.';
                return;
            }

            // Check WebSocket connection
            if (!isSocketOpen) {
                gptResult.innerHTML = "WebSocket connection not established.";
                return;
            }

            // Show loading indicator
            if (loadingIndicator) {
                loadingIndicator.style.display = 'block';
            }

            // Send prompt via WebSocket
            socket.send(JSON.stringify({ prompt }));

            // Handle WebSocket response
            socket.onmessage = function(event) {
                const data = JSON.parse(event.data);

                // Hide loading indicator
                if (loadingIndicator) {
                    loadingIndicator.style.display = 'none';
                }

                // Display result
                gptResult.innerHTML = data.result;
            };

            socket.onerror = function(error) {
                console.error('WebSocket Error:', error);

                // Hide loading indicator
                if (loadingIndicator) {
                    loadingIndicator.style.display = 'none';
                }

                gptResult.innerHTML = "Error processing WebSocket response.";
            };
        });
    }
});
