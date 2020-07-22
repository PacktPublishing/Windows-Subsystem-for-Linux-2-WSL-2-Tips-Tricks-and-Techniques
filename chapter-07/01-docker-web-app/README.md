# README

This is a sample project to show how to package a Python web app in a Docker container.

## Running locally

To run the code locally, follow the following steps:

* ensure you have python3 installed (see <https://wiki.python.org/moin/BeginnersGuide/Download>). You can test if python3 is installed by running `python3 -c 'print("hello")'` 
* install requirements by running ` pip3 install -r requirements.txt`
* start the web application by running `gunicorn --bind 0.0.0.0:5000 app:app`


## Building a docker image

 To build the docker image, run:

 ```bash
 docker build -t simple-python-app -f Dockerfile .
 ```

 This will build an image called `simple-python-app`

# Running the docker image

To run a container using the image above, run:

```bash
docker run -d -p 5000:5000 --name chapter-07-example simple-python-app
```

## Cleaning up the container

To stop and remove the container, run:

```bash
docker stop chapter-07-example
docker rm chapter-07-example
```