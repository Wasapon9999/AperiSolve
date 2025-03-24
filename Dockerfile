FROM python:3.10.11-slim-bullseye
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --upgrade pip
RUN pip install Flask==2.3.2
RUN pip install Flask-PyMongo==2.3.0
RUN pip install Flask-Babel==2.0.0
RUN pip install Werkzeug==3.0.6
RUN pip install gunicorn

# Copy the rest of the application
COPY . .

EXPOSE 8088
CMD ["gunicorn", "-w 4", "-b", "0.0.0.0:8088", "app:app"]
