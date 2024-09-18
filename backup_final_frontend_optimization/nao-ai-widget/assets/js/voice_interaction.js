// Voice interaction script to manage microphone input (STT) and play audio (TTS)

const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
const SpeechSynthesis = window.speechSynthesis;

const recognition = new SpeechRecognition();
recognition.lang = 'en-US';
recognition.continuous = false;

document.addEventListener('DOMContentLoaded', function() {
    const startVoiceBtn = document.getElementById('start-voice');
    const gptResult = document.getElementById('gpt-result');

    if (startVoiceBtn) {
        startVoiceBtn.addEventListener('click', function() {
            recognition.start();
        });

        recognition.onresult = function(event) {
            const transcript = event.results[0][0].transcript;
            console.log('Voice input: ' + transcript);

            fetch('/api/gpt4o', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ prompt: transcript }),
            })
            .then(response => response.json())
            .then(data => {
                gptResult.innerHTML = data.result;

                // Convert response text to speech
                const utterance = new SpeechSynthesisUtterance(data.result);
                SpeechSynthesis.speak(utterance);
            })
            .catch(error => {
                console.error('Error:', error);
                gptResult.innerHTML = "Error processing voice request.";
            });
        };

        recognition.onerror = function(event) {
            console.error('Speech recognition error:', event);
        };
    }
});
