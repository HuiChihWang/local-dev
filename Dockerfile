FROM ubuntu AS dev-base

# update packages
RUN apt-get update

#install curl
RUN apt-get install -y curl

# install git
RUN apt-get install -y git

# install nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs

# setup working directory
WORKDIR /project



