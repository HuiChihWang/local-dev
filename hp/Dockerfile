FROM ubuntu AS dev-base

# update packages
RUN apt-get update

#install curl
RUN apt-get install -y curl

# install git
RUN apt-get install -y git

# install unzip
RUN apt-get install -y unzip

# install aws-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

# install vim
RUN apt-get install -y vim

# install nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs

COPY ./tool /root/tool

# setup working directory
WORKDIR /project



## CONNECT TO AWS CLOUD
#CMD ["sh", "./tool/ssh_tunnel.sh"]
#
## EXPOSE MONGO PORT
#EXPOSE 5566



