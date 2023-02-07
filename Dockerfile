FROM luffy01/taku:hero

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt update -y && sudo apt upgrade -y && \
    apt-get install -y mediainfo wget build-essential checkinstall  libreadline-gplv2-dev  libncursesw5-dev  libssl-dev  libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev && \
    cd /usr/src && \
    sudo wget https://www.python.org/ftp/python/3.8.10/Python-3.8.10.tgz && \
    sudo tar xzf Python-3.8.10.tgz && \
    cd Python-3.8.10 && \
    sudo ./configure --enable-optimizations && \
    sudo make altinstall



COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt


CMD ["bash", "start.sh"]
