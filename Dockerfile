FROM python:3.7.2-slim

WORKDIR /usr/src/app

RUN pip install holdup

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ./app .

EXPOSE 8080

CMD python manage.py runserver 0.0.0.0:8080