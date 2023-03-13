FROM nvidia/cuda:11.7.1-devel-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
# Makes it easier to go download stuff
RUN apt-get install -y git python3 python3-pip aria2

# Set alias
RUN echo 'alias python="python3"' >> ~/.bashrc

# Clone
RUN git clone https://github.com/oobabooga/text-generation-webui

RUN pip3 install -r text-generation-webui/requirements.txt

RUN git clone https://github.com/qwopqwop200/GPTQ-for-LLaMa

RUN cd GPTQ-for-LLaMa && python3 setup_cuda.py install
