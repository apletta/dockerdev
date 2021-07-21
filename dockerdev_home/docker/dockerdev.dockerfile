#!/bin/bash
FROM ubuntu:18.04

WORKDIR /root/dockerdev_home

# Install some necessary packages
RUN apt-get update && apt-get install -y wget tmux vim x11vnc xvfb

# Just some environment stuff
ENV TERM=xterm-256color
RUN echo 'export PS1="\[\033[38;5;40m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;39m\]\w\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"' >> /root/.bashrc


# Install some ROS dependencies
RUN apt-get install -y python3.7
RUN apt-get install -y python3-pip
RUN python3.7 -m pip install --upgrade pip==19.0
RUN pip3 install tensorflow==2.1.0 cv2==3.3.1 pandas==1.1.3 numpy==1.19.2 scipy==1.5.2 tqdm==4.54.1 imaug==0.4.0 matplotlib==3.3.2 re==2.2.1 glob2==0.7 urllib3==1.25.9 jupyterlab

# Setup VNC
RUN mkdir ~/.vnc
CMD x11vnc -forever -usepw -create -passwd dockerdev
