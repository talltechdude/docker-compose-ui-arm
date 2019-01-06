FROM resin/armv7hf-python

RUN [ "cross-build-start" ]

RUN pip install virtualenv

RUN apt-get update && apt-get install -y \
                git \
        && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/francescou/docker-compose-ui.git /app

RUN virtualenv /env && /env/bin/pip install --no-cache-dir -r /app/requirements.txt

VOLUME ["/opt"]

EXPOSE 5000

CMD []

ENTRYPOINT ["/env/bin/python", "/app/main.py"]

WORKDIR /opt

RUN [ "cross-build-end" ]