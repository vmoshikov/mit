from os import environ
from flask import Flask

from keycloak import Client
from keycloak.extensions.flask import AuthenticationMiddleware

from dashboard.routes import dashboard_routes

app = Flask(__name__)

app.config["SECRET_KEY"] = environ.get('SECRET_KEY')
app.wsgi_app = AuthenticationMiddleware(
        app.wsgi_app,
        app.config,
        app.session_interface,
        callback_url=f"http://localhost/dashboard/oidc_callback",
)

kc = Client()

dashboard_routes(app, kc)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
