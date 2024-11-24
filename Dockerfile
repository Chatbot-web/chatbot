# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY . .

# Expose the port your app runs on
EXPOSE 8000

# Define the command to run your application
# For Flask, replace "main" with your app's entry point file
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:$PORT", "app:app"]
