from os import uname
from flask import Flask
app = Flask(__name__)

def gethostname():
    return uname()[1]

@app.route("/")
def home():
    return f"<html><body><h1>Hello from {gethostname()}</h1></body></html>"
