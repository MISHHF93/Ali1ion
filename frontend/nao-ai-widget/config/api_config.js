/**
 * API Configuration for NAOAI Frontend Widget
 * Handles environment-based API settings, NAO-AI Model integration, and common configurations
 */

// Base URLs for different environments
const API_BASE_URLS = {
    development: 'http://localhost:8000/api',
    production: 'https://api.naoai.com/api',
    staging: 'https://staging.api.naoai.com/api',
  };
  
  // Current environment: can be 'development', 'production', or 'staging'
  const ENVIRONMENT = process.env.NODE_ENV || 'development';
  
  // Base URL based on current environment
  const API_BASE_URL = API_BASE_URLS[ENVIRONMENT];
  
  // NAO-AI Model API settings
  const MODEL_API_URL = "https://platform.openai.com/assistants/asst_8Q8CNm5hzJi2ynbC9mSmSOHf";
  const MODEL_API_KEY = "sk-proj-UgyvOY6W4dOe16ogKcZWT3BlbkFJk70y2k9tCs21Ry27oAq4";  // Replace with actual key
  
  /**
   * Utility to make API requests
   * @param {string} endpoint - The API endpoint (e.g., '/generate-text')
   * @param {object} options - Fetch options like method, headers, and body
   * @returns {Promise<object>} - Returns a promise that resolves with the response data
   */
  async function makeApiRequest(endpoint, options = {}) {
    const url = `${API_BASE_URL}${endpoint}`;
  
    try {
      const response = await fetch(url, options);
  
      // Check if the response is OK (status 200-299)
      if (!response.ok) {
        throw new Error(`API request failed: ${response.status} ${response.statusText}`);
      }
  
      const data = await response.json();
      return data;
    } catch (error) {
      console.error('Error during API request:', error);
      throw error; // Rethrow error to handle it further in the calling code
    }
  }
  
  /**
   * Utility to make NAO-AI Model API requests
   * @param {object} body - The request body for the NAO-AI Model
   * @returns {Promise<object>} - Returns a promise that resolves with the response data
   */
  async function makeModelApiRequest(body) {
    try {
      const response = await fetch(MODEL_API_URL, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${MODEL_API_KEY}`,
        },
        body: JSON.stringify(body),
      });
  
      // Check if the response is OK (status 200-299)
      if (!response.ok) {
        throw new Error(`Model API request failed: ${response.status} ${response.statusText}`);
      }
  
      const data = await response.json();
      return data;
    } catch (error) {
      console.error('Error during NAO-AI Model API request:', error);
      throw error; // Rethrow error for further handling
    }
  }
  
  // Common headers for API requests
  const DEFAULT_HEADERS = {
    'Content-Type': 'application/json',
    Accept: 'application/json',
  };
  
  // Export configuration and helper functions
  export default {
    ENVIRONMENT,
    API_BASE_URL,
    MODEL_API_URL,
    MODEL_API_KEY,
    DEFAULT_HEADERS,
    makeApiRequest,
    makeModelApiRequest,
  };
  