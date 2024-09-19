// This script will handle interaction with NAOAI through AJAX and APIs
document.addEventListener('DOMContentLoaded', function () {

  // Show loader while fetching data
  function showLoader(element) {
    element.innerHTML = 'Loading...';
    element.disabled = true;  // Disable button during request
  }

  // Hide loader and restore button text
  function hideLoader(element, originalText) {
    element.innerHTML = originalText;
    element.disabled = false;  // Re-enable button after request
  }

  // Display error messages
  function showError(outputElement, message) {
    outputElement.innerHTML = `<div class="alert alert-danger">${message}</div>`;
  }

  // Handle real-time market analysis
  async function getMarketAnalysis() {
    const analysisOutput = document.getElementById('market-analysis');
    const analysisButton = document.getElementById('get-analysis-btn');

    // Clear previous output
    analysisOutput.innerText = '';

    showLoader(analysisButton);

    try {
      let response = await fetch('/api/naoai/real_time_analysis', {
        method: 'GET'
      });

      if (!response.ok) {
        throw new Error('Failed to fetch market analysis.');
      }

      let data = await response.json();

      if (data && data.analysis) {
        analysisOutput.innerText = data.analysis;
      } else {
        showError(analysisOutput, 'No analysis available.');
      }
    } catch (error) {
      showError(analysisOutput, error.message || 'Error fetching market analysis.');
      console.error('Error fetching market analysis:', error);
    } finally {
      hideLoader(analysisButton, 'Get Market Analysis');
    }
  }

  // Handle personalized marketing campaign generation
  async function generatePersonalizedCampaign() {
    const campaignOutput = document.getElementById('campaign-output');
    const campaignButton = document.getElementById('generate-campaign-btn');

    // Clear previous output
    campaignOutput.innerText = '';

    showLoader(campaignButton);

    try {
      let response = await fetch('/api/naoai/personalized_campaign', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ customer_id: '12345', preferences: { language: 'en' } })
      });

      if (!response.ok) {
        throw new Error('Failed to generate campaign.');
      }

      let data = await response.json();

      if (data && data.campaign) {
        campaignOutput.innerText = data.campaign;
      } else {
        showError(campaignOutput, 'No campaign generated.');
      }
    } catch (error) {
      showError(campaignOutput, error.message || 'Error generating campaign.');
      console.error('Error generating campaign:', error);
    } finally {
      hideLoader(campaignButton, 'Generate Campaign');
    }
  }

  // Attach event listeners to the buttons
  document.getElementById('get-analysis-btn').addEventListener('click', getMarketAnalysis);
  document.getElementById('generate-campaign-btn').addEventListener('click', generatePersonalizedCampaign);

});
