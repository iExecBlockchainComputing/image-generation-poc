> **Important**  
>
> This PoC is currently NOT compatible with Scone but compatible with TDX.  
> Please use it with the [iExec SDK 8.13.0-tdx](https://github.com/aimen-djari/iexec-sdk/tree/feature/tdx) (If you do not have access to it, please contact us).

# Image Generator iApp

The **Image Generator iApp** is a **Confidential Computing application** that generates an image based on a provided text prompt. It leverages **iExec's Trusted Execution Environments (TEE)** and the **CompVis/stable-diffusion-v1-4 model** from Hugging Face for secure, private computation.

> **Prerequisites**  
>
> - Docker 17.05 or higher on the daemon and client.  
> - Dockerhub account.  
> - [iExec SDK 8.13.0-tdx](https://github.com/aimen-djari/iexec-sdk/tree/feature/tdx) (If you do not have access to it, please contact us) installed.  

## 🚀 Features
- **Confidential Computing** ensures that prompts remain private and are processed securely.
- **Decentralized Execution** using the iExec network.
- **CompVis/stable-diffusion-v1-4 model-based image generation** to generate an image based on its textual description.

---

## 🏗 **Build and Run the iApp Locally**

1️⃣ **Build the docker image**:


   ```sh  
   docker build . -t image-generator  
 ```
    
   
2️️⃣ **Run the iApp in Docker**:  


   ```sh  
   docker run --rm \  
   -v ./iexec_in:/iexec_in \  
   -v ./iexec_out:/iexec_out \  
   -e IEXEC_IN=/iexec_in \  
   -e IEXEC_OUT=/iexec_out \  
   -e IEXEC_REQUESTER_SECRET_1="your prompt" \
   image-generator
```
    
---
## 🏁 Run iApp on iExec

> **Note**  
> Only works with the [iExec SDK 8.13.0-tdx](https://github.com/aimen-djari/iexec-sdk/tree/feature/tdx) (If you do not have access to it, please contact us)

This section allows you to test this PoC without deploying your own iApp, for this purpose, we've deployed an example app for you (``0xDEBE66164C0026f2dBCcaCF2364F07a42c441f2f``). Otherwise, if you’re looking to deploy and run your own iApp on the iExec stack, head to [this section](#deploy-and-run-on-iexec-stack).

1️⃣ **Deploy your requester secret on iExec**  
This PoC uses requester secrets. In order to use it, please follow the official iExec guide: 
🔗 [Create Requester Secret](https://protocol.docs.iex.ec/for-developers/confidential-computing/requester-secrets#push-some-requester-secrets-to-the-sms)

2️⃣ **Run the iApp**


```shell 
    iexec app run --secret 1=$YOUR_SECRET --workerpool tdx-labs.pools.iexec.eth --tag tee,tdx 0xDEBE66164C0026f2dBCcaCF2364F07a42c441f2f
```

---

## 🏗 **Deploy and Run on iExec Stack** 🌍

> **Note**  
> This section is for builders looking to deploy and run their own iApp on the iExec stack. If you’re only testing, an example app is already available for you. To get started, head to [this section](#run-iapp-on-iexec).

1️⃣ **Build and Push Image to Docker Hub**  

   ```sh  
   docker build . -t yourdockerhubusername/image-generator:1.0.0 
   docker push yourdockerhubusername/image-generator:1.0.0  
```
2️⃣ **Deploy Your iApp on iExec**  
   Follow the official iExec guide to deploy a TDX iApp:  
   🔗 [Deploy a TDX iApp](https://github.com/iExecBlockchainComputing/documentation/blob/feature/tdx-testbed/for-developers/confidential-computing/create-your-first-tdx-app.md)  

3️⃣ **Publish a iApp Order**  
   Once deployed, you must publish a iApp order to allow usage:  
   🔗 [Manage App Orders](https://protocol.docs.iex.ec/for-developers/advanced/manage-your-apporders)  



