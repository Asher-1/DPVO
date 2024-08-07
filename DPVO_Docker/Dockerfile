ARG CUDA_VERSION
FROM nvidia/cuda:${CUDA_VERSION}-cudnn8-devel-ubuntu20.04

# Env vars for the nvidia-container-runtime.
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute

ENV PATH="/root/miniconda3/bin:${PATH}"

RUN apt-get update
RUN apt-get install -y unzip sudo git

RUN apt-get update
RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 

RUN apt-get update

RUN git clone https://github.com/Asher-1/DPVO.git --recursive
WORKDIR /DPVO

RUN wget https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.zip
RUN unzip eigen-3.4.0.zip -d thirdparty

RUN conda init bash && . ~/.bashrc
RUN conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
RUN conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
RUN conda config --set show_channel_urls yes
RUN conda update conda
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install -U pip
RUN conda env create -f environment.yml

COPY install_dpvo.sh /DPVO/install_dpvo.sh
COPY cmake-3.30.2-linux-x86_64.sh /DPVO/
RUN chmod +x cmake-3.30.2-linux-x86_64.sh

# This command runs your application, comment out this line to compile only
CMD ["bash"]
