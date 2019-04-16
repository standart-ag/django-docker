# Django Docker
Django docker boilerplate with postgres database in Docker containers using Docker compose.

## Start a new project:

```bash
docker-compose run --rm django_app django-admin startproject <name> .
docker-compose run --rm django_app python manage.py startapp <name>
docker-compose run --rm django_app chmod -Rv 777 .
```

Configure DB.

Add this to `settings.py`:
```python
POSTGRES_USER =     os.environ['POSTGRES_USER']      or 'postgres'
POSTGRES_PASSWORD = os.environ['POSTGRES_PASSWORD']  or 'postgres'
POSTGRES_DB =       os.environ['POSTGRES_DB']        or 'postgres'
POSTGRES_HOST =     os.environ['POSTGRES_HOST']      or 'db'
POSTGRES_PORT = int(os.environ['POSTGRES_PORT'])     or 5432

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': POSTGRES_DB,
        'USER': POSTGRES_USER,
        'PASSWORD': POSTGRES_PASSWORD,
        'HOST': POSTGRES_HOST,
        'PORT': POSTGRES_PORT,
    }
}
```

Make migrations:

```bash
docker-compose run --rm django_app python manage.py makemigrations
docker-compose run --rm django_app python manage.py migrate
```

Create admin user:
```bash
docker-compose run --rm django_app python manage.py createsuperuser
```

RUN
```
docker-compose up
```