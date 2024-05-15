FROM python:3.8-slim-buster

RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python-setuptools
RUN apt-get install -y build-essential
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-mysqldb
RUN pip3 install flask
COPY app.py /opt/
ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0
