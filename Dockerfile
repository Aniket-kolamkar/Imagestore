# base image
FROM python:3.9-alpine
FROM continuumio/miniconda3:latest
FROM python:3.9-slim-buster

# set environment variables
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y python3-venv

RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

# create a working directory
WORKDIR /micronet
# Activate the environment, and make sure it's activated:
# SHELL ["conda", "run", "-n", "myenv", "/bin/bash", "-c"]
# copy the requirements file
RUN pip install --upgrade pip  
COPY . /
# run this command to install all dependencies  
# Install additional dependencies
WORKDIR /micronet
COPY requirements.txt /micronet/
RUN pip install -r requirements.txt

# Set environment variables
ENV DJANGO_SETTINGS_MODULE=micronet.settings
COPY . /micronet/
# Run your application
# RUN python manage.py makemigrations
# RUN python manage.py migrate
CMD python manage.py runserver 0.0.0.0:8200