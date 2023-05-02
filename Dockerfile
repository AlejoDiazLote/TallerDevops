FROM python:3.8.5-alpine

RUN pip install --upgrade pip

COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY ./rp-portfolio /app

WORKDIR /app

COPY ./entrypoint.sh /
ENTRYPOINT ["sh", "/entrypoint.sh"]


# FROM python:latest
# RUN apt-get update -y
# RUN apt-get upgrade -y
# WORKDIR /app
# EXPOSE 8000
# COPY ./rp-portfolio/ .  
# RUN pip install --upgrade pip
# RUN pip install -r requirements.txt
# RUN python manage.py makemigrations
# RUN python manage.py migrate
# CMD [ "python","manage.py","runserver","0.0.0.0:8000" ]