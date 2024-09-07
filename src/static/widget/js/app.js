document.getElementById("trigger-ai").addEventListener("click", function() {
    fetch('/nao-ai-response/')
        .then(response => response.json())
        .then(data => {
            // Display the AI response in the widget
            document.getElementById('response').innerHTML = data.message;
        })
        .catch(error => {
            console.error('Error:', error);
        });
});
