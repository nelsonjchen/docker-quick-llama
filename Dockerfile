# Reference https://gitlab.com/nvidia/container-images/cuda/blob/master/doc/supported-tags.md
FROM docker.io/nvidia/cuda:11.8.0-devel-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
# Makes it easier to go download stuff
RUN apt-get install -y git python3 python3-pip aria2 wget curl

# Set common alias
RUN echo 'alias python="python3"' >> ~/.bashrc

# Clone repositories down
RUN git clone https://github.com/oobabooga/text-generation-webui

RUN pip3 install -r text-generation-webui/requirements.txt

RUN git clone https://github.com/qwopqwop200/GPTQ-for-LLaMa

# https://github.com/pytorch/extension-cpp/issues/71#issuecomment-1183674660
# And https://developer.nvidia.com/cuda-gpus
# Really only target 3xxx and up series
ENV TORCH_CUDA_ARCH_LIST="8.6+PTX"

RUN cd /GPTQ-for-LLaMa && python3 setup_cuda.py install

# Pre-download model metadata
RUN cd /text-generation-webui/ && \
  python3 download-model.py --text-only decapoda-research/llama-7b-hf && \
  python3 download-model.py --text-only decapoda-research/llama-13b-hf && \
  python3 download-model.py --text-only decapoda-research/llama-30b-hf && \
  python3 download-model.py --text-only decapoda-research/llama-65b-hf

# Reference: https://github.com/oobabooga/text-generation-webui/issues/416#issuecomment-1475105606
#  Search and replace all instances of "LLaMATokenizer" to "LlamaTokenizer" in "tokenizer_config.json" underneath /text-generation-webui/models
RUN cd /text-generation-webui/models && \
  find . -name "tokenizer_config.json" -exec sed -i 's/LLaMATokenizer/LlamaTokenizer/g' {} \;

# No 4 bit models included. See https://huggingface.co/maderix/llama-65b-4bit/tree/main
# Make a bash script at /download-4bit-model.sh to download the 30b model with curl from https://huggingface.co/maderix/llama-65b-4bit/resolve/main/llama30b-4bit.pt to /text-generation-webui/models/llama-30b-hf/llama30b-4bit.pt and make it executable
RUN echo '#!/bin/bash' > /download-4bit-model.sh && \
  echo 'curl -L https://huggingface.co/maderix/llama-65b-4bit/resolve/main/llama30b-4bit.pt -o /text-generation-webui/models/llama-30b-hf/llama30b-4bit.pt' >> /download-4bit-model.sh && \
  chmod +x /download-4bit-model.sh


ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV PYTHONPATH="/GPTQ-for-LLaMa:$PYTHONPATH"
