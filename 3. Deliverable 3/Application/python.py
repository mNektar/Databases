from urllib import request

import app as app

app.route('/login', methods=['POST', 'GET'])

def login():
    error = None
    if request.method == 'POST':
        if valid_login(request.form['username'],
                       request.form['password']):
            return log_the_user_in(request.form['username'])
        else:
            error = 'Invalid username/password'

    return render_template('login.views', error=error)