import json
import httpx
from flask import Flask
from flask import session, render_template, current_app, redirect

from keycloak import Client
from keycloak.config import config


def dashboard_routes(app: Flask, kc: Client):
    @app.route('/')
    @app.route('/dashboard/')
    def index():
        result = dict()
        current_app.logger.debug('We in dashboard page in second app')

        if session.get('user'):
            current_app.logger.debug('We has user info')
            result['user'] = session['user']

        return render_template('home.html', result=result)

    @app.route("/dashboard/oidc_callback")
    def oidc_callback():
        user = session["user"]
        return redirect('/dashboard')

    @app.route('/dashboard/logout', methods=['GET'])
    def logout():
        tokens = json.loads(session.get('tokens'))
        config.openid.end_session_endpoint = "http://keycloak:8080/auth/realms/CoreRealm/protocol/openid-connect/logout"
        if tokens:
            kc.logout(tokens.get('access_token'), tokens.get('refresh_token'))
            session['state'] = None
            session['user'] = None
        return redirect('/')

    @app.route('/dashboard/login', methods=['GET'])
    def login():
        """ Initiate authentication """
        url, state = kc.login()
        session['state'] = state
        return redirect(url)