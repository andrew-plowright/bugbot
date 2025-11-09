# Use an official Python runtime as a base image
FROM python:3.13-slim

# Create a non-root user and ensure the working directory exists
RUN addgroup --system django_app \
    && adduser --system --ingroup django_app django_user \
    && mkdir -p /app \
    && chown -R django_user:django_app /app

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project files
COPY --chown=django_user:django_app . .

# Switch to the non-root user
USER django_user