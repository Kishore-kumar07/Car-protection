# Use the latest Ubuntu base image
FROM ubuntu:latest

# Set environment variables
ENV PYTHONBUFFERED=1

# Install required system dependencies
RUN apt-get update && \
    apt-get install -y python3-pip libgl1-mesa-glx libglib2.0-0

# Set the working directory
WORKDIR /django

# Copy the requirements.txt file
COPY requirements.txt requirements.txt

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the entire current directory into the container
COPY . .

# Specify the command to run the application
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]