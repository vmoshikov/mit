from unittest import TestCase
from urllib.parse import urlsplit, parse_qs

# import mock
from keycloak import Client


class KeycloakTestCase(TestCase):
    client = Client()

    def test_client_id(self):
        """
        Кейс: Получить ID клиента авторизации
        Ожидается: Для прохождения теста требуется `core` KeyCloak Client
        """
        url, key = self.client.login()
        params = dict(parse_qs(urlsplit(url).query))

        self.assertTrue(key)
        self.assertEqual(params['client_id'][0], 'core')

    def test_service_account(self):
        """
        Кейс: Инициализация корректного callback_url
        Ожидается: Совпадение client.callback_uri с требуемым параметром
        """

        self.assertEqual(self.client.callback_uri, 'http://localhost/kc/callback')
        self.assertEqual(self.client.userinfo.get('preferred_username'), 'service-account-core')
