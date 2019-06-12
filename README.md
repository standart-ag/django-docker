# Django Docker boilerplate with Postgres
> Django docker boilerplate with Postgres database in Docker containers using Docker compose.

## Prerequisites

* Docker `docker`
* Docker compose `docker-compose`

You don't need Python and modules to run this project, however it will be needed for linting e.t.c.

## Start a new project:

First of all download this project, then run:
```bash
#[ALREADY DONE]# docker-compose run --rm django_app django-admin startproject <name> .
docker-compose run --rm django_app python manage.py startapp <name>
docker-compose run --rm django_app chmod -Rv 777 .
```

## Configure DB

`[Already done]`: Add database settings to your `settings.py`:
```python
POSTGRES_USER =     os.environ.get('POSTGRES_USER',     'postgres')
POSTGRES_PASSWORD = os.environ.get('POSTGRES_PASSWORD', 'postgres')
POSTGRES_DB =       os.environ.get('POSTGRES_DB',       'postgres')
POSTGRES_HOST =     os.environ.get('POSTGRES_HOST',     'db')
POSTGRES_PORT = int(os.environ.get('POSTGRES_PORT',     5432))

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

## Django bootstrap actions

Make migrations:
```bash
docker-compose run --rm django_app python manage.py makemigrations
docker-compose run --rm django_app python manage.py migrate
```

Create admin user:
```bash
docker-compose run --rm django_app python manage.py createsuperuser
```

# Using your application

Start your application by running:
```bash
docker-compose up --build
```

See your app in action: [http://localhost:8080](http://localhost:8080)

Use `CTRL+C` to stop your app.

## Changelog
* `12.06.2019`: Added holdup script to wait till postgres is ready.

## Contributing

1. Fork it (<https://github.com/standart-ag/django-docker/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
