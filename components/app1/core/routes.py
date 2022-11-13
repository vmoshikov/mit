from flask import Blueprint, session, render_template, make_response, current_app, redirect

core = Blueprint('core', __name__)


@core.route('/')
def index():
    result = dict()
    current_app.logger.debug('We in core page in first app')
    if session.get('user'):
        current_app.logger.debug('We has user info')
        result['user'] = session["user"]
    return render_template('home.html', result=result)

# @core.route('/logout')
# def kc_custom_logout():
#     if "tokens" in session:
#         del session["tokens"]
#
#     if "user" in session:
#         del session["user"]
#
#     return redirect('/')