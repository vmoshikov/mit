from flask import Flask
from core.routes import core
from adapters.keycloak import auth
from os import environ
from keycloak.extensions.flask import AuthenticationMiddleware

app = Flask(__name__)

app.config["SECRET_KEY"] = environ.get('SECRET_KEY')

app.wsgi_app = AuthenticationMiddleware(
        app.wsgi_app,
        app.config,
        app.session_interface,
        callback_url=f"http://localhost/oidc_callback"
)

app.register_blueprint(core)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
