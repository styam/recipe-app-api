FROM python:3.7-alpine
MAINTAINER Satyam Mishra

ENV PYTHONUNBUFFERED 1

#Copy requirements and install it into our docker
COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

#Create a directory and copy all the data from our local system to docker image
RUN mkdir /app
WORKDIR /app
COPY ./app /app

#Add user to run this application this is for security without this anyone can access this application as root user
RUN adduser -D user
USER user
