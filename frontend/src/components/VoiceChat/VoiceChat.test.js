import { render, screen, fireEvent } from '@testing-library/react';
import VoiceChat from './VoiceChat';

test('renders the VoiceChat component and checks button functionality', () => {
  // Render the VoiceChat component
  render(<VoiceChat />);

  // Get the button element
  const buttonElement = screen.getByText(/Speak/i);

  // Check if the button is in the document
  expect(buttonElement).toBeInTheDocument();

  // Click the button and check if the status text changes to "Ali1ion is speaking..."
  fireEvent.click(buttonElement);
  expect(screen.getByText(/Ali1ion is speaking.../i)).toBeInTheDocument();
});
