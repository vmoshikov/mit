import json
import httpx
from flask import Flask
from flask import session, render_template, current_app, redirect

from keycloak import Client
from keycloak.config import config


def core_routes(app: Flask, kc: Client):
    @app.route('/')
    def index():
        result = dict()
        current_app.logger.debug(f"Keycloak user: {kc.username}")

        if session.get('user'):
            current_app.logger.debug('We has user info')
            result['user'] = session['user']

        return render_template('home.html', result=result)

    @app.route('/login', methods=['GET'])
    def login():
        url, state = kc.login()
        session['state'] = state
        return redirect(url)

    @app.route('/logout', methods=['GET'])
    def logout():
        """
        Custom logout action to KeyCloak
        В нормальных условиях разработки KeyCloak стоит как отдельное SSO приложение
        с множеством подключенных к нему приложений (на базе внутренних теплейтов)
        соответствено у KeyCloak есть выделенный домен (Frontend URL) для авторизации.

        В текущем варианте KeyCloak не имеет доступного из браузера домена (за исключением docker name keycloak)
        и для демонстрации работы используется хак перезаписи значения end_session_endpoint
        """
        tokens = json.loads(session.get('tokens', '{}'))
        config.openid.end_session_endpoint = "http://keycloak:8080/auth/realms/CoreRealm/protocol/openid-connect/logout"
        if tokens.get('access_token'):
            kc.logout(tokens.get('access_token'), tokens.get('refresh_token'))
            session['state'] = None
            session['user'] = None
        return redirect('/')

    @app.route("/kc/callback/")
    @app.route("/oidc_callback")
    def oidc_callback():
        user = session["user"]
        return f"Howdy {user}"
