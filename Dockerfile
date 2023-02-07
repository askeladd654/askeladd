FROM luffy01/taku:hero

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt-get update && \
    apt-get install -y mediainfo software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && \
    apt install -y python3.8

COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt


CMD ["bash", "start.sh"]
