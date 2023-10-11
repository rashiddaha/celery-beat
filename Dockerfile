# pull official base image
FROM python:3.12.0-bookworm

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r requirements.txt


# # copy entrypoint.sh
# COPY entrypoint.sh /usr/src/app/entrypoint.sh
# RUN chmod +x /usr/src/app/entrypoint.sh

# copy project
COPY . /usr/src/app/
RUN python manage.py migrate
RUN python manage.py collectstatic --no-input --clear

# Add execute permissions to entrypoint.sh

# run entrypoint.sh
# ENTRYPOINT ["/usr/src/app/entrypoint.sh"]