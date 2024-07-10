# Stage 1: Build Python App (nao_ai_functions.py)
FROM python:3.10-slim AS python-app
WORKDIR /app
COPY nao-ai-function/application-integration/backend-services/python-app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY nao-ai-function/application-integration/backend-services/python-app /app
CMD ["python3", "nao_ai_functions.py"]

# Stage 2: Build Node.js App
FROM node:14 AS node-app
WORKDIR /usr/src/app
COPY nao-ai-function/application-integration/backend-services/node-app/package*.json ./
RUN npm install --only=production
COPY nao-ai-function/application-integration/backend-services/node-app /usr/src/app
EXPOSE 8080
CMD ["node", "app.js"]

# Stage 3: Build Another Python App (main.py)
FROM python:3.9-slim AS cloud-functions-app
WORKDIR /app
COPY nao-ai-function/compute-resources/cloud-functions/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY nao-ai-function/application-integration/main.py /app
CMD ["python", "main.py"]

# Final Stage: Combining all the stages
FROM python:3.10-slim
WORKDIR /app

# Install Node.js for the Node.js app
RUN apt-get update && apt-get install -y nodejs npm

# Copy Python App (nao_ai_functions.py)
COPY --from=python-app /app /app/python-app

# Copy Node.js App
COPY --from=node-app /usr/src/app /app/node-app

# Copy Another Python App (main.py)
COPY --from=cloud-functions-app /app /app/cloud-functions-app

# Define entrypoints for each service
CMD ["sh", "-c", "\
  python3 /app/python-app/nao_ai_functions.py & \
  node /app/node-app/app.js & \
  python /app/cloud-functions-app/main.py \
"]
