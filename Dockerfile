FROM alpine:3.2

RUN apk add --update bash ca-certificates git \
                     nodejs=0.12.2-r0 \
                     python3=3.4.3-r2  && \
    rm -rf /var/cache/apk/*
RUN easy_install-3.4 pip==7.1.0 virtualenv==13.1.2

RUN adduser -D -h /code itscozy
WORKDIR /code
ADD manage.sh /code/manage.sh

ADD package.json /code/package.json
ADD bower.json /code/bower.json
RUN ./manage.sh htmldeps

ADD manage_collectstatic.sh /code/manage_collectstatic.sh
RUN ./manage.sh collectstatic

ADD requirements.txt /code/requirements.txt
ADD test-requirements.txt /code/test-requirements.txt
RUN ./manage.sh pythondeps

ADD run.py /code/run.py
ADD alembic /code/alembic
ADD itscozy /code/itscozy
ADD pylint.conf /code/pylint.conf

USER itscozy
ENTRYPOINT ["/code/manage.sh"]
CMD ["run"]
