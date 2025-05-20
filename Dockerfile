FROM alpine:3.18
RUN apk update && apk add --no-cache python3 && apk add py3-pip
#RUN apk add py3-pip
RUN mkdir -p /var/flask/
WORKDIR /var/flask/
#COPY ./app.py .
#COPY ./requirements.txt .
COPY . .
RUN  pip3 install -r requirements.txt
EXPOSE 5000
CMD ["app.py"]
ENTRYPOINT ["/usr/bin/python3"]

