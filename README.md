# oobabooga Text generation web UI Llama Docker Toolkit

*WIP as the situation is rapidly, rapidly evolving.*

STATUS: Not ready, just sketching out.

This is a toolkit to run "Text generation web UI" from [oobabooga](https://github.com/oobabooga/text-generation-webui) with Llama weights on [vast.ai](https://vast.ai), [runpod.io](https://www.runpod.io/) or similar cheap GPU providers.

It is a culmination of following the guide on the wiki: https://github.com/oobabooga/text-generation-webui/wiki/LLaMA-model

It does not include the Llama weights, but it does pre-install some dependencies and utilities that one may find helpful to download LLama weights. Source is left up to you. If you aren't a "researcher", I would suggest hitting up https://4chan.org/g/ and looking for "ai chatbot" or similar with your browser search as a good starting point. If you are a researcher, I'm sure you can find the weights through the proper channels through Facebook.

The outputs of this toolkit are this guide with some rough guidance, and an accessible Docker image with 90% of the work done. Don't spend too much time fumbling while the GPU is idle, use a lot of it prebuilt.

## Usage

Make sure you have accounts on vast.ai or runpod.io or similar, and have some money loaded on them.

Specify this image and target a GPU that is at least a 1080 or above.

In the built environment, login and install the weights accordingly to the guide. Included in the image is `aria2c`, a wonderful download tool that supports BitTorrent and HTTP downloads.

### Vast.ai

You should already have a vast.ai account and have loaded it with some money.

