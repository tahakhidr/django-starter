@echo off

:: Create a virtual environment
python -m venv venv

:: Activate the virtual environment (for Windows Command Prompt)
call venv\Scripts\activate.bat

:: Install project dependencies
pip install -r requirements.txt

:: Apply database migrations
python manage.py migrate

:: Create the superuser
python manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', '1')"

:: Start the server
python manage.py runserver