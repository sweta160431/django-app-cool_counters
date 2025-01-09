#Base Image
FROM python:3.7

#Working Directory
WORKDIR /app

#Code Copy
COPY . .

#Install Libraries
RUN pip install -r requirements.txt

#Migration
Run python cool_counters/manage.py migrate

#Run App
CMD ["python","cool_counters/manage.py","runserver","0.0.0.0:8000"]
