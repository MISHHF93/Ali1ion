# Move the widget template into frontend/widget
mv /workspaces/NAO-AI/src/nao_ai_module/templates/widget/index.html /workspaces/NAO-AI/frontend/widget/

# Create a new templates directory in frontend and move the other HTML files
mkdir -p /workspaces/NAO-AI/frontend/templates
mv /workspaces/NAO-AI/src/nao_ai_module/templates/generate_image.html /workspaces/NAO-AI/frontend/templates/
mv /workspaces/NAO-AI/src/nao_ai_module/templates/generate_text.html /workspaces/NAO-AI/frontend/templates/
mv /workspaces/NAO-AI/src/nao_ai_module/templates/home.html /workspaces/NAO-AI/frontend/templates/

# Optionally remove the now-empty templates directory in nao_ai_module
rm -r /workspaces/NAO-AI/src/nao_ai_module/templates/widget
rm -r /workspaces/NAO-AI/src/nao_ai_module/templates
