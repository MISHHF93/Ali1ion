# Stage 1: Build Python App (nao_ai_functions.py)
FROM python:3.10-slim AS python-app
WORKDIR /home/mishari_borah/nao-ai-project

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Copy requirements and install dependencies
COPY requirements.txt /home/mishari_borah/nao-ai-project/requirements.txt
RUN pip install --no-cache-dir -r /home/mishari_borah/nao-ai-project/requirements.txt

# Copy application code for nao_ai_functions.py
COPY application-integration/backend-services/python-app /home/mishari_borah/nao-ai-project/application-integration/backend-services/python-app

# Copy the test script
COPY test_install.py /home/mishari_borah/nao-ai-project/test_install.py

# Debugging step: List the contents of the directory
RUN ls -la /home/mishari_borah/nao-ai-project/application-integration/backend-services/python-app

# Verify the installation of packages
RUN pip list

CMD ["python3", "/home/mishari_borah/nao-ai-project/test_install.py"]

# Stage 2: Build Node.js App
FROM node:14 AS node-app
WORKDIR /home/mishari_borah/nao-ai-project

# Copy package.json and install dependencies
COPY application-integration/backend-services/node-app/package*.json /home/mishari_borah/nao-ai-project/application-integration/backend-services/node-app/
RUN npm install --only=production

# Copy application code for Node.js app
COPY application-integration/backend-services/node-app /home/mishari_borah/nao-ai-project/application-integration/backend-services/node-app

# Debugging step: List the contents of the directory
RUN ls -la /home/mishari_borah/nao-ai-project/application-integration/backend-services/node-app

EXPOSE 8080
CMD ["node", "app.js"]

# Stage 3: Build Another Python App (main.py)
FROM python:3.10-slim AS cloud-functions-app
WORKDIR /home/mishari_borah/nao-ai-project

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Copy requirements and install dependencies
COPY requirements.txt /home/mishari_borah/nao-ai-project/requirements.txt
RUN pip install --no-cache-dir -r /home/mishari_borah/nao-ai-project/requirements.txt

# Copy application code for main.py
COPY application-integration /home/mishari_borah/nao-ai-project/application-integration

# Debugging step: List the contents of the directory
RUN ls -la /home/mishari_borah/nao-ai-project/application-integration

# Verify the installation of packages
RUN pip list

CMD ["python3", "/home/mishari_borah/nao-ai-project/application-integration/main.py"]

# Final Stage: Combining all the stages
FROM python:3.10-slim
WORKDIR /home/mishari_borah/nao-ai-project

# Install Node.js for the Node.js app
RUN apt-get update && apt-get install -y nodejs npm

# Copy Python App (nao_ai_functions.py)
COPY --from=python-app /home/mishari_borah/nao-ai-project/application-integration/backend-services/python-app /home/mishari_borah/nao-ai-project/application-integration/backend-services/python-app

# Copy Node.js App
COPY --from=node-app /home/mishari_borah/nao-ai-project/application-integration/backend-services/node-app /home/mishari_borah/nao-ai-project/application-integration/backend-services/node-app

# Copy Another Python App (main.py)
COPY --from=cloud-functions-app /home/mishari_borah/nao-ai-project/application-integration /home/mishari_borah/nao-ai-project/application-integration

# Copy the test script (optional, remove if not needed)
COPY test_install.py /home/mishari_borah/nao-ai-project/test_install.py

# Debugging step: List the contents of the final directory
RUN ls -la /home/mishari_borah/nao-ai-project
RUN ls -la /home/mishari_borah/nao-ai-project/application-integration/backend-services/python-app
RUN ls -la /home/mishari_borah/nao-ai-project/application-integration

# Verify the installation of node and npm
RUN node -v && npm -v

# Define entrypoints for each service
CMD ["sh", "-c", "\
  python3 /home/mishari_borah/nao-ai-project/test_install.py && \
  python3 /home/mishari_borah/nao-ai-project/application-integration/backend-services/python-app/nao_ai_functions.py & \
  node /home/mishari_borah/nao-ai-project/application-integration/backend-services/node-app/app.js & \
  python3 /home/mishari_borah/nao-ai-project/application-integration/main.py \
"]
