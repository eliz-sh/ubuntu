FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get install -y openssh-server git-core libxml2-dev curl python build-essential make gcc python-dev wget libsqlite3-dev sqlite3
RUN apt-get install -y postgresql-client-9.1 postgresql-client-common libpq5
RUN apt-get install -y libpq-dev

RUN wget https://bootstrap.pypa.io/ez_setup.py
RUN python ez_setup.py

RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

 RUN pip3 install --upgrade pip
 RUN pip3 install numpy
 RUN pip3 install requests
 RUN pip3 install pandas
 RUN pip3 install xlrd
 RUN pip3 install xlwt
 RUN pip3 install openpyxl
 RUN pip3 install datetime
 RUN pip3 install py-postgresql

 CMD ["python3", "./daily_rep.py"]
