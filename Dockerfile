FROM luffy01/taku:hero

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt-get update && apt-get install -y python3.8

RUN rm /usr/bin/python && rm /usr/bin/python3 && ln -s /usr/bin/python3.8 /usr/bin/python && ln -s /usr/bin/python3.8 /usr/bin/python3 \
    && rm /usr/local/bin/python && rm /usr/local/bin/python3 && ln -s /usr/bin/python3.8 /usr/local/bin/python && ln -s /usr/bin/python3.8 /usr/local/bin/python3 \
    && apt-get install -y python3-pip python-dev python3.8-dev && python3 -m pip install pip --upgrade

COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt


CMD ["bash", "start.sh"]
