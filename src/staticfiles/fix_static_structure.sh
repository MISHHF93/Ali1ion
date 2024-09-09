#!/bin/bash

# Step 1: Create the required directories and files
echo "Creating directories and files for the widget and CGI..."

# Navigate to the static folder (ensure it's present)
cd /workspaces/NAO-AI/src/static || exit

# Creating the necessary folders if they do not exist
mkdir -p cdn_cgi widget/css widget/js widget/images

# Step 2: Create a basic hello.cgi script
echo "Creating hello.cgi..."
cat <<EOL > cdn_cgi/hello.cgi
#!/bin/bash
echo "Content-type: text/html"
echo ""
echo "<html><body><h1>Hello from NAO-AI CGI Script</h1></body></html>"
EOL

# Make the CGI script executable
chmod +x cdn_cgi/hello.cgi

# Step 3: Create a basic trace.sh script
echo "Creating trace.sh..."
cat <<EOL > cdn_cgi/trace.sh
#!/bin/bash
echo "Content-type: text/plain"
echo ""
echo "Trace information:"
whoami
date
EOL

# Make the shell script executable
chmod +x cdn_cgi/trace.sh

# Step 4: Create widget index.html
echo "Creating index.html for the widget..."
cat <<EOL > widget/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NAO AI Widget</title>
    <link rel="stylesheet" type="text/css" href="{% static 'widget/css/styles.css' %}">
</head>
<body>
    <h1>Welcome to the NAO AI Widget</h1>
    <img src="{% static 'widget/images/logo.png' %}" alt="NAO AI Logo">
    <div id="widget-content">
        <!-- Your widget content here -->
    </div>
    <script src="{% static 'widget/js/app.js' %}"></script>
</body>
</html>
EOL

# Step 5: Create a basic styles.css
echo "Creating styles.css for the widget..."
cat <<EOL > widget/css/styles.css
body {
    font-family: Arial, sans-serif;
    text-align: center;
    background-color: #f4f4f4;
}
h1 {
    color: #333;
}
EOL

# Step 6: Create a basic app.js
echo "Creating app.js for the widget..."
cat <<EOL > widget/js/app.js
document.addEventListener('DOMContentLoaded', function() {
    console.log('NAO AI Widget loaded successfully.');
});
EOL

# Step 7: Add an image file (logo.png placeholder)
echo "Adding placeholder image logo.png..."
cat <<EOL > widget/images/logo.png
[This should be a binary image file, replace this comment with your image upload or download script]
EOL

# Step 8: Create the Django view to render the widget
echo "Updating views.py..."
cat <<EOL >> /workspaces/NAO-AI/src/nao_ai_module/views.py

def widget_view(request):
    """
    Renders the widget page.
    """
    return render(request, 'widget/index.html')
EOL

# Step 9: Add URL pattern for the widget
echo "Updating urls.py..."
cat <<EOL >> /workspaces/NAO-AI/src/nao_ai_module/urls.py

urlpatterns += [
    path('widget/', views.widget_view, name='widget'),  # Widget page route
]
EOL

# Step 10: Provide instructions for running CGI with Python (optional)
echo "Instructions for running CGI scripts in development:
- To run CGI scripts, configure a web server like Apache or Nginx.
- You can use Django's static serving for testing, but it's not ideal for production.
"

echo "All files created successfully. You're ready to run the widget!"
