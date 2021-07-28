FROM jupyter/minimal-notebook

WORKDIR /root/dockerdev_home

USER root

# Install environment packages
RUN apt-get update && apt-get install -y wget tmux vim 

# Just some environment stuff
ENV TERM=xterm-256color
RUN echo 'export PS1="\[\033[38;5;40m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;39m\]\w\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"' >> /root/.bashrc

# Install python modules
RUN apt-get install -y python3.6
RUN apt-get install -y python3-pip
RUN python3 -m pip install --upgrade pip
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6 -y
RUN pip3 install numpy==1.19.2
RUN pip3 install tensorflow==2.5.0 
RUN pip3 install pandas==1.1.3
RUN pip3 install scipy==1.6.0
RUN pip3 install tqdm==4.54.1
RUN pip3 install matplotlib==3.3.1
RUN pip3 install glob2==0.7
RUN pip3 install urllib3==1.25.9
#RUN pip3 install jupyterlab
#RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install imgaug==0.4.0
RUN pip3 install opencv-python
#RUN pip3 install re==2.2.1

#ENV PATH=/root/dockerdev_home:${PATH}
ENV PYTHONPATH /usr/local/lib/python3.6/dist-packages/

#ADD --chown=joyvan . PYTHONPATH
