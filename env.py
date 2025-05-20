from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html.tmpl',app_version="Version1",my_message=message)

if __name__ == '__main__':
    app_port = os.getenv("APP_PORT",8000)
    message = os.getenv("MESSAGE",this is for git commit change)

    app.run(host="0.0.0.0",port=app_port)
