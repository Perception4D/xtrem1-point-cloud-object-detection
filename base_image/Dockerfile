FROM nvidia/cuda:11.5.2-cudnn8-devel-ubuntu20.04

USER root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get clean && apt-get update \
    && apt-get install -y apt-utils ca-certificates git wget sudo vim net-tools 

# install python
RUN apt-get install -y libffi-dev zlib1g-dev libssl-dev python3-dev python3-pip \
    && ln -svf /usr/bin/python3 /usr/bin/python \
    && ln -svf /usr/bin/pip3 /usr/bin/pip \
    && pip install --upgrade pip

# install PyTorch
RUN pip install torch torchvision --index-url https://download.pytorch.org/whl/cu118

# install spconv
RUN pip install spconv-cu118

WORKDIR /app

# install pcdet
ENV TORCH_CUDA_ARCH_LIST="7.0 7.5+PTX 8.0 8.6"
COPY . ./
RUN pip install -e .

RUN pip install -U numpy==1.23.5
