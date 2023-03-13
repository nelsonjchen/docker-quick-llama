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

# https://github.com/pytorch/extension-cpp/issues/71#issuecomment-1183674660
# And https://developer.nvidia.com/cuda-gpus
# Generally target 1080 and up
ENV TORCH_CUDA_ARCH_LIST="6.1;7.0;7.5;8.0;8.6+PTX"

RUN cd /GPTQ-for-LLaMa && python3 setup_cuda.py install

RUN cd /text-generation-webui/ && \
  python3 download-model.py --text-only decapoda-research/llama-7b-hf && \
  python3 download-model.py --text-only decapoda-research/llama-13b-hf && \
  python3 download-model.py --text-only decapoda-research/llama-30b-hf && \
  python3 download-model.py --text-only decapoda-research/llama-65b-hf
