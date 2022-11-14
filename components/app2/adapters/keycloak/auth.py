from os import environ
from flask import Flask
from keycloak.extensions.flask import AuthenticationMiddleware


def init(app: Flask) -> AuthenticationMiddleware:
    app.config["SECRET_KEY"] = environ.get('SECRET_KEY')
    print('Initialize keycloak')

    return AuthenticationMiddleware(
            app.wsgi_app,
            app.config,
            app.session_interface,
            callback_url=f"http://localhost/kc/",
            logout_uri="/logout",
            logout_redirect_uri="http://localhost/kc/"
    )
