document.addEventListener("DOMContentLoaded", function() {
    const sendButton = document.getElementById("send-button");
    const userInput = document.getElementById("user-input");
    const responseDiv = document.getElementById("response");

    sendButton.addEventListener("click", function() {
        const userText = userInput.value.trim();
        if (userText) {
            displayResponse("Sending...");
            sendRequest(userText);
        }
    });

    function sendRequest(userText) {
        fetch("/api/nao-ai", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ message: userText })
        })
        .then(response => {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.json();
        })
        .then(data => {
            displayResponse(data.response);
        })
        .catch(error => {
            console.error("Error:", error);
            displayResponse("Sorry, something went wrong. Please try again.");
        });
    }

    function displayResponse(responseText) {
        responseDiv.innerHTML = "";  // Clear previous responses
        const responseElement = document.createElement("p");
        responseElement.textContent = responseText;
        responseDiv.appendChild(responseElement);
        userInput.value = "";  // Clear the input field
    }
});
