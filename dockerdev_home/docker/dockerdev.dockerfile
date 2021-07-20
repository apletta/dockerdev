FROM ros:foxy

WORKDIR /root/dockerdev_home

# Install some necessary packages
RUN sudo apt update && sudo apt install -y wget tmux vim x11vnc xvfb ~nros-foxy-rqt*

# Install miniconda
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b
ENV PATH=/root/miniconda3/bin:${PATH}
RUN rm -f Miniconda3-latest-Linux-x86_64.sh
RUN conda init

# Just some environment stuff
ENV TERM=xterm-256color
RUN echo 'export PS1="\[\033[38;5;40m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;39m\]\w\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"' >> /root/.bashrc
RUN echo 'source /opt/ros/foxy/setup.bash' >> /root/.bashrc

# Install some ROS dependencies
RUN python -m pip install catkin_pkg numpy 

# Setup VNC
RUN mkdir ~/.vnc
CMD x11vnc -forever -usepw -create -passwd dockerdev
