# Dockerfile

# Pull base image
FROM python:3.7-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

# Install dependencies

COPY . /code/
COPY requirements.txt /code/
COPY entrypoint /
COPY start /
RUN chmod +x /entrypoint
RUN chmod +x /start

RUN pip install -r requirements.txt

ENTRYPOINT ["/entrypoint"]
CMD ["/start"]