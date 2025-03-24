FROM python:3.10.11-slim-bullseye
WORKDIR /app
COPY . .
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=production
RUN pip install -r requirements.txt gunicorn
EXPOSE 8088
CMD ["gunicorn", "-w 4", "-b", "0.0.0.0:8088", "app:app"]
