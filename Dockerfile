FROM huggingface/transformers-pytorch-gpu

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
RUN apt-get install -y aria2

# Set alias
RUN echo 'alias python="python3"' >> ~/.bashrc

# Clone
RUN git clone https://github.com/oobabooga/text-generation-webui

RUN cd text-generation-webui && pip3 install -r requirements.txt
