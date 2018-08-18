FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD Pipfile /code/
ADD Pipfile.lock /code/
RUN pip install -U pipenv
RUN pipenv install --system
ADD . /code/
RUN cd /code/
CMD django-admin startproject celeryimplementation