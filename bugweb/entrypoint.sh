#!/bin/sh

# Exit immediately if any command fails (returns a non-zero exit status).
set -e

#echo "Migrating database"
#python3 manage.py migrate

# Check the environment
echo "Development environment: $DJANGO_ENV"
if [ "$DJANGO_ENV" = "development" ]; then

    # In development, we use the Django development server (i.e.: 'runserver'). It allows
    # auto-reloading, interactive debugging, and handles static files.
    echo "Starting Django development server..."
    python manage.py runserver 0.0.0.0:8000

elif [ "$DJANGO_ENV" = "production" ] || [ "$DJANGO_ENV" = "staging" ]; then

    #echo "Collecting static files"
    echo "Collecting static..."
    python3 manage.py collectstatic --noinput

    # In production and staging, we use Gunicorn, that has better performance
    echo "Starting Gunicorn server..."
    exec gunicorn bugbot.wsgi:application --bind 0.0.0.0:8000

else
    echo "Unknown environment. Set DJANGO_ENV with the name of the environment. Exiting..."
    exit 1
fi