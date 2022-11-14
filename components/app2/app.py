import json
import httpx
from os import environ

from flask import Flask
from flask import session, render_template, current_app, redirect
from keycloak import Client
from keycloak.config import config
from keycloak.utils import auth_header
from keycloak.extensions.flask import AuthenticationMiddleware

app = Flask(__name__)

app.config["SECRET_KEY"] = environ.get('SECRET_KEY')
app.wsgi_app = AuthenticationMiddleware(
        app.wsgi_app,
        app.config,
        app.session_interface,
        callback_url=f"http://localhost/dashboard/oidc_callback",
)
kc = Client()


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
    return f"Howdy {user}"


@app.route('/dashboard/logout', methods=['GET'])
def logout():
    """ Initiate authentication """
    tokens = json.loads(session.get('tokens'))
    config.openid.end_session_endpoint = "http://keycloak:8080/auth/realms/CoreRealm/protocol/openid-connect/logout"
    if tokens:
        kc.logout(tokens.get('access_token'), tokens.get('refresh_token'))
        payload = {
            "client_id": config.client.client_id,
            "client_secret": config.client.client_secret,
            "refresh_token": tokens.get('refresh_token'),
        }
        headers = auth_header(tokens.get('access_token'))
        # log.debug("Logging out user from server")
        httpx.post(
                config.openid.end_session_endpoint, data=payload, headers=headers
        )
        session['state'] = None
        session['user'] = None
    return redirect('/')


@app.route('/dashboard/login', methods=['GET'])
def login():
    """ Initiate authentication """
    url, state = kc.login()
    session['state'] = state
    return redirect(url)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
