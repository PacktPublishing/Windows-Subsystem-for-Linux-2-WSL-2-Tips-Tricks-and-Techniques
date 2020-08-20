from os import uname
from flask import Flask
app = Flask(__name__)

def get_os_info():
    result = uname()
    sysname = result.sysname
    release = result.release
    return f"{sysname} ({release})"

@app.route("/")
def home():
    return f"<html><body><h1>Hello from {get_os_info()}</h1></body></html>"
