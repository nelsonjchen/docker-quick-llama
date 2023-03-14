# oobabooga Text generation web UI Llama Docker Toolkit

*WIP as the situation is rapidly, rapidly evolving. people are running this on CPUs with fast RAM instead of GPUs so maybe this might not be worth it.*

STATUS: Not ready, just sketching out.

This is a toolkit to run "Text generation web UI" from [oobabooga](https://github.com/oobabooga/text-generation-webui) with Llama weights on [vast.ai](https://vast.ai), [runpod.io](https://www.runpod.io/) or similar cheap GPU providers.

It is a culmination of following the guide on the wiki: https://github.com/oobabooga/text-generation-webui/wiki/LLaMA-model

It does not include the Llama weights, but it does pre-install some dependencies and utilities that one may find helpful to download LLama weights. Source is left up to you. If you aren't a "researcher", I would suggest hitting up https://4chan.org/g/ and looking for "ai chatbot" or similar with your browser search as a good starting point. If you are a researcher, I'm sure you can find the weights through the proper channels through Facebook.

The outputs of this toolkit are this guide with some rough guidance, and an accessible Docker image with 90% of the work done. Don't spend too much time fumbling while the GPU is idle, use a lot of it prebuilt.

## Usage

apologies for the skeitchiness

Make sure you have accounts on vast.ai or runpod.io or similar, and have some money loaded on them.

Specify the `ghcr.io/nelsonjchen/docker-quick-llama:main`, 50GB of space, and target a host and GPU that is at least a 3080 or above with CUDA 12.

One template to use might be this: https://console.vast.ai/?ref_id=46153&template_id=b785ef1aede88b85cf8dd818503d2778

In the built environment, login and install the weights accordingly to the guide. You can download weights with `curl -L -O` as well. Alternatively you can use aria2c to torrent alternative sources for the weights.

### Vast.ai

You should already have a vast.ai account and have loaded it with some money.

