import json
from unittest import TestCase
from flask import Flask

from keycloak import Client

from core.routes import core_routes


# from flask_pytest_example.handlers.routes import configure_routes


class FlaskRoutesTestCase(TestCase):
    app = Flask(__name__)
    kc = Client()
    core_routes(app, kc)

    def test_home_route(self):
        """
        Кейс: Проверка доступности сервиса
        Ожидается: Тестовый темплейт и status_code 200
        """
        client = self.app.test_client()
        url = '/'

        response = client.get(url)
        self.assertEqual(response.get_data(), b'Fist app home template')
        self.assertEqual(response.status_code, 200)

    def test_logout_route(self):
        """
        Кейс: Проверка корректности редиректа на сторону KeyCloak
        Ожидается: Ожидается 302 редирект. Мы получим status_code 500 если запустим вне Docker Container
        :return:
        """
        client = self.app.test_client()
        url = '/logout'

        response = client.get(url)
        self.assertEqual(response.status_code, 302)

