// Get references to the sphere, status text, and button
const sphere = document.getElementById('sphere');
const statusText = document.getElementById('statusText');
const speakButton = document.getElementById('speakButton');
const particlesContainer = document.getElementById('particles');

// Helper function to create a particle
function createParticle() {
    const particle = document.createElement('div');
    particle.classList.add('particle');

    // Randomize starting position around the sphere (x and y axis)
    particle.style.left = `calc(50% + ${(Math.random() * 120) - 60}px)`; // Wider range for X position
    particle.style.top = `calc(50% + ${(Math.random() * 120) - 60}px)`;  // Wider range for Y position

    // Duration and scale for more visibility
    particle.style.animationDuration = `${2 + Math.random() * 2}s`; 
    particle.style.opacity = 0.4 + Math.random() * 0.6;  // More opacity for better visibility
    particle.style.transform = `scale(${0.7 + Math.random() * 0.6})`;  // Scale for larger particles

    particlesContainer.appendChild(particle);

    // Remove particle after it finishes the animation
    setTimeout(() => particle.remove(), 5000);  // Extended lifespan for better visibility
}

// Simulate NAO-AI speaking with synchronized sphere and halo animations + enhanced particles
function naoAISpeaks() {
    // Update status text
    statusText.textContent = 'NAO-AI is speaking...';

    // Make the sphere and halo "breathe" faster and more vibrantly
    sphere.style.animation = 'breathing 0.6s infinite ease-in-out';
    document.querySelector('.glow-ring').style.animation = 'pulseGlow 0.6s infinite ease-in-out';

    // Generate particles much more frequently
    let particleInterval = setInterval(createParticle, 25);  // Particles created every 25ms (4x frequency)

    // Simulate speaking duration
    setTimeout(() => {
        // Return to idle animation for both sphere and halo
        sphere.style.animation = 'breathing 1s infinite ease-in-out';
        document.querySelector('.glow-ring').style.animation = 'pulseGlow 1s infinite ease-in-out';

        // Update status text
        statusText.textContent = 'NAO-AI is idle...';

        // Stop generating particles
        clearInterval(particleInterval);
    }, 5000);  // Simulate speaking for 5 seconds
}

// Add event listener for the button
speakButton.addEventListener('click', naoAISpeaks);

// Start idle breathing animation for sphere and halo
sphere.style.animation = 'breathing 1s infinite ease-in-out';
document.querySelector('.glow-ring').style.animation = 'pulseGlow 1s infinite ease-in-out';
