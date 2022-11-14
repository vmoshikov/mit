FROM python:3.9

WORKDIR /app
COPY requirements.txt /app

RUN pip3 install --upgrade pip -r requirements.txt
COPY . /app

ENV KEYCLOAK_SETTINGS='/app/keycloak.json'
EXPOSE 5000
CMD python app.py

