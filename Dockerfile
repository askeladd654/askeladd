FROM luffy01/taku:hero

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt-get install -y python3.8
RUN ln -s /usr/bin/python3.8 /usr/bin/python
RUN apt-get install -y python3-pip

COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt


CMD ["bash", "start.sh"]
