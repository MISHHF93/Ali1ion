# Stage 1: Build Python App (nao_ai_functions.py)
FROM python:3.10-slim AS python-app
WORKDIR /home/mishari_borah/nao_ai_project

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Manually install Flask in case it's not in the requirements
RUN pip install Flask==2.3.2

# Copy application code (Adjust path here)
COPY src/nao_ai_module/ ./application_integration/backend_services/python_app/

# Verify the installation of packages
RUN pip list

# Optional: Run a test script
COPY src/tests/test_install.py ./src/tests/test_install.py
CMD ["python3", "src/tests/test_install.py"]

# Stage 2: Build Node.js App
FROM node:14 AS node-app
WORKDIR /home/mishari_borah/nao_ai_project

# Copy package.json and install dependencies
COPY src/backend/package*.json ./application_integration/backend_services/node_app/
RUN npm install --only=production

# Copy application code (Adjust path here)
COPY src/backend/ ./application_integration/backend_services/node_app/

# Expose port for Node.js application
EXPOSE 7860
CMD ["node", "application_integration/backend_services/node_app/app.js"]

# Stage 3: Build Another Python App (main.py)
FROM python:3.10-slim AS cloud-functions-app
WORKDIR /home/mishari_borah/nao_ai_project

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Manually install Flask in case it's not in the requirements
RUN pip install Flask==2.3.2

# Copy application code (Adjust path here)
COPY src/nao_ai_module/ ./application_integration/

# Verify the installation of packages
RUN pip list

# Optional: Run a test script
CMD ["python3", "application_integration/main.py"]

# Final Stage: Combining all the stages
FROM python:3.10-slim
WORKDIR /home/mishari_borah/nao_ai_project

# Install Node.js for the Node.js app
RUN apt-get update && apt-get install -y nodejs npm

# Copy Python App (Adjust path here)
COPY --from=python-app /home/mishari_borah/nao_ai_project/application_integration/backend_services/python_app/ ./application_integration/backend_services/python_app/

# Copy Node.js App
COPY --from=node-app /home/mishari_borah/nao_ai_project/application_integration/backend_services/node_app/ ./application_integration/backend_services/node_app/

# Copy Another Python App (main.py)
COPY --from=cloud-functions-app /home/mishari_borah/nao_ai_project/application_integration/ ./application_integration/

# Debugging steps (optional)
RUN ls -la ./application_integration/backend_services/python_app/
RUN ls -la ./application_integration/

# Install OpenAI package for Python
RUN pip install openai

# Install Flask explicitly if still needed
RUN pip install Flask==2.3.2

# Define entrypoints for each service
CMD ["sh", "-c", "\
  python3 application_integration/backend_services/python_app/nao_ai_functions.py & \
  node application_integration/backend_services/node_app/app.js & \
  python3 application_integration/main.py \
"]
