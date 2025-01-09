# Simple Django App
This is a simple, minimal Django app intended to help understand the main aspects of working with Django.

## Usage Instructions
Clone this repository e.g.

```
git clone git@github.com:sweta160431/django-app-cool_counters.git
```

Navigate to the 'cool_counters' Django project:

```
cd simple-django-app/cool_counters
```

Run migrations to update/create database
```
python manage.py migrate
```

Run the Django development server
```
python manage.py runserver
```

Navigate to to http://0.0.0.0:8000

# Setup Docker

### 1. Install Docker in Your System  
Run the following commands to install Docker on your machine:  
```bash
sudo apt-get update 
sudo apt-get install docker.io -y
```
Verify the Docker installation:  
```bash
docker --version
```

---

### 2. Create a Project Directory  
Create a directory for your project and navigate to it:  
```bash
mkdir simple-django-app
cd simple-django-app
```

---

### 3. Create a Dockerfile  
Create a `Dockerfile` to define the image for your Django project:  
```bash
vim Dockerfile
```

Add the following content to the `Dockerfile`:  
```dockerfile
# Use Python 3.7 as the base image
FROM python:3.7

# Set the working directory inside the container
WORKDIR /app

# Copy all files into the working directory
COPY . .

# Install dependencies from requirements.txt
RUN pip install -r requirements.txt

# Run database migrations
RUN python cool_counters/manage.py migrate

# Start the Django development server
CMD ["python", "cool_counters/manage.py", "runserver", "0.0.0.0:8000"]
```

---

### 4. Build the Docker Image  
Use the `docker build` command to create an image for your app:  
```bash
docker build -t counter-app .
```

---

### 5. Verify Docker Images  
Check the list of Docker images to confirm the build was successful:  
```bash
docker images
```

---

### 6. Create and Run a Docker Container  
Use the `docker run` command to create and start a container from the image:  
```bash
docker run -it -d -p 8000:8000 counter-app:latest
```
This will map port 8000 on your host machine to port 8000 in the container.

---

### 7. Verify Running Containers  
Check the status of running containers using:  
```bash
docker ps
```

Now you can access your Django app in the browser at:  
`http://localhost:8000`  
Or if you are using an AWS EC2 instance, use its public IP address.

Result:

![Screenshot (10)](https://github.com/user-attachments/assets/5c7f5ced-79ed-44c8-ab51-f7233ca28a3a)


If you see an HTTP ALLOWED_HOSTS error, navigate to the cool_counters directory:

cd cool_counters
Then, you can list the contents of the directory to verify:

ls
Update the settings.py file to add your host to the ALLOWED_HOSTS list.

ALLOWED_HOSTS ["*"]

Result

![Screenshot (11)](https://github.com/user-attachments/assets/1ec585c9-a516-465c-b8ab-60fae9fa5dfd)


