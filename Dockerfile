# Dockerfile

# Pull base image
FROM python:3.7-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /var/www/code

# Set work directory
WORKDIR /var/www/code

# Install dependencies

COPY . /var/www/code/
COPY requirements.txt /var/www/code/
COPY entrypoint /
COPY start /
RUN chmod +x /entrypoint
RUN chmod +x /start

VOLUME /var/www/code/

VOLUME /etc/nginx/

RUN pip install -r requirements.txt

ENTRYPOINT ["/entrypoint"]
CMD ["/start"]