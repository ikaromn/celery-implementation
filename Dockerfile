FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN apt update -y &&\
    apt upgrade -y &&\
    apt install -y supervisor
RUN mkdir /code
WORKDIR /code
ADD Pipfile /code/
ADD Pipfile.lock /code/
RUN pip install pipenv
RUN pipenv install --dev --system
ADD . /code/
RUN cd /code/
EXPOSE 8000