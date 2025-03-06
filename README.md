_This repository has been deprecated and the project moved to a new public repository. Please only refer to [image-generation-poc](https://github.com/iExecBlockchainComputing/Image-Generation) from now on._

(CURRENTLY NOT COMPATIBLE WITH Scone but compatible with TDX)

# Image Generation
This Decentralized application (dApp) generates an image based on a provided text prompt and verifies whether the generated image aligns with the given description. The dApp utilizes state-of-the-art AI models for text-to-image generation, ensuring high-quality and relevant outputs.

The current implementation uses the BLIP model from Hugging Face (https://huggingface.co/docs/transformers/en/model_doc/blip) for image captioning and validation. Additionally, it incorporates a text-to-image model to generate images based on user-provided prompts.

To ensure privacy and security, the dApp leverages Confidential Computing to perform the computations securely, preventing unauthorized access to sensitive data.

This dApp incentivizes users to provide meaningful and descriptive prompts, aiming for high alignment between the generated image and the intended description.

### Input 
The dApp takes one input namely an iExec dataset. 

- iExec Dataset (private): an encrypted file, which only gets decrypted inside the enclave, ensuring no data gets revealed to anyone. 

### Output 
The (public) output of the dApp is the generated image itself, ensuring that users receive a visual representation of their input prompt while maintaining data confidentiality.

### Run dapp locally 
1. Generate the docker image

```console
docker build --tag ig .
```

2. Run the image with the example prompt located in the src/iexec_in folder. You have to update the path

```console
docker run --rm \
    -v ./src/iexec_in:/iexec_in \
    -v ./src/iexec_out:/iexec_out \
    -e IEXEC_IN=/iexec_in \
    -e IEXEC_OUT=/iexec_out \
    -e IEXEC_DATASET_FILENAME=prompt.txt \
    ig
```

### Run dapp on iExec (only with the iExec SDK 8.13.0-tdx)

- Dapp Address: 

```shell 
    iexec app run --dataset $YOUR_DATASET_ADDRESS --workerpool tdx-labs.pools.iexec.eth --tag tee,tdx
```
