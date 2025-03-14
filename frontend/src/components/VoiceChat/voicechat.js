import React, { useEffect, useRef, useState } from 'react';
import './voicechat.css'; // Make sure the CSS is imported

const VoiceChat = () => {
  const sphereRef = useRef(null); // Sphere reference
  const statusTextRef = useRef(null); // Status text reference
  const particlesContainerRef = useRef(null); // Particle container reference
  const glowRingRef = useRef(null); // Glow ring reference
  const [isSpeaking, setIsSpeaking] = useState(false); // State to control speaking animation
  const particleIntervalRef = useRef(null); // Interval reference for cleanup

  // Helper function to create a particle
  const createParticle = () => {
    const particle = document.createElement('div');
    particle.classList.add('particle');

    // Randomize starting position around the sphere (x and y axis)
    particle.style.left = `calc(50% + ${(Math.random() * 120) - 60}px)`; // Wider range for X position
    particle.style.top = `calc(50% + ${(Math.random() * 120) - 60}px)`; // Wider range for Y position

    // Duration and scale for more visibility
    particle.style.animationDuration = `${2 + Math.random() * 2}s`;
    particle.style.opacity = 0.4 + Math.random() * 0.6; // More opacity for better visibility
    particle.style.transform = `scale(${0.7 + Math.random() * 0.6})`; // Scale for larger particles

    particlesContainerRef.current.appendChild(particle);

    // Remove particle after it finishes the animation
    setTimeout(() => particle.remove(), 5000); // Extended lifespan for better visibility
  };

  // Simulate Ali1ion speaking with synchronized sphere and halo animations + enhanced particles
  const naoAISpeaks = () => {
    setIsSpeaking(true); // Set state to speaking
    statusTextRef.current.textContent = 'Ali1ion is speaking...';

    // Generate particles more frequently
    particleIntervalRef.current = setInterval(createParticle, 25); // Particles created every 25ms

    // Simulate speaking duration for 5 seconds
    setTimeout(() => {
      setIsSpeaking(false); // Return to idle
      statusTextRef.current.textContent = 'Ali1ion is idle...';

      clearInterval(particleIntervalRef.current); // Stop particle generation
    }, 5000);
  };

  // Add event listener for the button click and animations on component mount
  useEffect(() => {
    // Add the breathing animation on idle
    if (sphereRef.current) {
      sphereRef.current.style.animation = 'breathing 1s infinite ease-in-out';
    }
    if (glowRingRef.current) {
      glowRingRef.current.style.animation = 'pulseGlow 1s infinite ease-in-out';
    }

    // Cleanup function when component unmounts
    return () => {
      if (particleIntervalRef.current) {
        clearInterval(particleIntervalRef.current); // Clear the particle interval if active
      }
    };
  }, []);

  return (
    <div className="container">
      {/* Sphere and its glow effect */}
      <div className="sphere" id="sphere" ref={sphereRef}>
        <div className="glow-ring" ref={glowRingRef}></div>
        <div className="particle-system" id="particles" ref={particlesContainerRef}></div>
      </div>

      {/* Status text below the sphere */}
      <div className="text-status" id="statusText" ref={statusTextRef}>
        Ali1ion is idle...
      </div>

      {/* Speak button */}
      <button className="action-button" id="speakButton" onClick={naoAISpeaks}>
        Speak
      </button>
    </div>
  );
};

export default VoiceChat;
