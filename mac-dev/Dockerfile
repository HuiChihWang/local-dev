# Use a base image (here we're using Ubuntu as an example)
FROM ubuntu:latest

# Install zsh and set it as the default shell
RUN apt-get update && apt-get install -y zsh && chsh -s $(which zsh)

RUN apt-get install -y curl

RUN apt-get install -y git

# Set the working directory
WORKDIR /app

# Start zsh shell when the container runs
CMD ["zsh"]

#COPY ./dev-setup.sh .
