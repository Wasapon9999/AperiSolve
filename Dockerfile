FROM python:3.10.11-slim-bullseye
WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install gunicorn
COPY . .

EXPOSE 8088
CMD ["gunicorn", "-w 4", "-b", "0.0.0.0:8088", "app:app"]
