# Dockerfile

# Pull base image
FROM python:3.8

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

# Install dependencies
COPY Pipfile Pipfile.lock /code/
RUN pip install pipenv && pipenv install --system

# You need to keep the requirements.txt inside the image because pip looks inside the image
COPY requirements.txt /code
RUN pip install -r requirements.txt

# Copy project
COPY . /code/
