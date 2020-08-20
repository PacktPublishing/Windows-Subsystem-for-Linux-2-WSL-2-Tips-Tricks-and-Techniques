FROM python:3.8-slim-buster

EXPOSE 5000

ADD requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
ADD . /app

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
