// Voice interaction script to manage microphone input (STT) and play audio (TTS)

const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
const SpeechSynthesis = window.speechSynthesis;

const recognition = new SpeechRecognition();
recognition.lang = 'en-US';
recognition.continuous = false;

document.addEventListener('DOMContentLoaded', function() {
    const startVoiceBtn = document.getElementById('start-voice');
    const gptResult = document.getElementById('gpt-result');
    const statusElement = document.getElementById('voice-status');  // New element to show status

    if (startVoiceBtn) {
        startVoiceBtn.addEventListener('click', function() {
            // Update UI to reflect that the recognition has started
            startVoiceBtn.disabled = true;
            startVoiceBtn.innerHTML = 'Listening...';
            recognition.start();
        });

        recognition.onresult = function(event) {
            const transcript = event.results[0][0].transcript;
            console.log('Voice input: ' + transcript);

            if (statusElement) {
                statusElement.innerHTML = 'Processing...'; // Show status
            }

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

                // Update the status
                if (statusElement) {
                    statusElement.innerHTML = 'Response received.';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                gptResult.innerHTML = "Error processing voice request.";
                
                if (statusElement) {
                    statusElement.innerHTML = 'Error occurred.';
                }
            })
            .finally(() => {
                // Reset the button state after processing
                startVoiceBtn.disabled = false;
                startVoiceBtn.innerHTML = 'Start Voice';
            });
        };

        recognition.onerror = function(event) {
            console.error('Speech recognition error:', event);
            gptResult.innerHTML = "Error with speech recognition.";
            
            if (statusElement) {
                statusElement.innerHTML = 'Error during recognition.';
            }

            // Reset the button state if an error occurs
            startVoiceBtn.disabled = false;
            startVoiceBtn.innerHTML = 'Start Voice';
        };

        recognition.onend = function() {
            // Recognition ends, re-enable the button
            startVoiceBtn.disabled = false;
            startVoiceBtn.innerHTML = 'Start Voice';

            if (statusElement) {
                statusElement.innerHTML = 'Ready for input.';
            }
        };
    }
});
