FROM alpine:3.18

ENV APP_ROOT /var/scripts/

ENV APP_PORT 8000

RUN mkdir -p "$APP_ROOT"

WORKDIR "$APP_ROOT"

COPY . .

#RUN adduser -h /var/scripts/ -s /bin/sh -D flaskuser
RUN adduser -h "$APP_ROOT" -s /bin/sh -D flaskuser

#RUN chown -R flaskuser:flaskuser /var/scripts/
RUN chown -R flaskuser:flaskuser "$APP_ROOT"

RUN apk update && apk add --no-cache python3 && apk add py3-pip

RUN  pip3 install -r requirements.txt

EXPOSE 8000

USER flaskuser

CMD ["env.py"]

ENTRYPOINT ["/usr/bin/python3"]

