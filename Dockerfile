FROM luffy01/taku:hero

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt-get update && apt-get install -y software-properties-common gcc && \
    add-apt-repository -y ppa:deadsnakes/ppa

RUN apt-get update && apt-get install -y mediainfo python3.8.10 python3-distutils python3-pip python3-apt


COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt


CMD ["bash", "start.sh"]
