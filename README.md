> **Important**  
>
> This PoC is currently NOT compatible with Scone but compatible with TDX.  
> Please use it with the iExec SDK 8.13.0-tdx (If you do not have access to it, please contact us).

# Image Generator dApp

The **Image Generator dApp** is a **Confidential Computing application** that generates an image based on a provided text prompt. It leverages **iExec's Trusted Execution Environments (TEE)** and the **CompVis/stable-diffusion-v1-4 model** from Hugging Face for secure, private computation.

## 🚀 Features
- **Confidential Computing** ensures that prompts remain private and are processed securely.
- **Decentralized Execution** using the iExec network.
- **CompVis/stable-diffusion-v1-4 model-based image generation** to generate an image based on its textual description.

---

## 🏗 **Run the dApp Locally**

### 1️⃣ **Set Up Your Development Environment**
Follow the iExec guide for setting up a local dApp:  
🔗 [Your First iExec App](https://protocol.docs.iex.ec/for-developers/your-first-app)

### 2️⃣ **Build and Run the dApp Locally**
1. **Build the docker image**:


   ```sh  
   docker build . -t image-generator  
    ```
    
2. **Prepare input file**:  
   Create a folder called `iexec_in` and put inside a **prompt.txt file** containing your prompt.  
   
3. **Run the dApp in Docker**:  


   ```sh  
   docker run --rm \  
   -v ./iexec_in:/iexec_in \  
   -v ./iexec_out:/iexec_out \  
   -e IEXEC_IN=/iexec_in \  
   -e IEXEC_OUT=/iexec_out \  
   -e IEXEC_DATASET_FILENAME=prompt.txt \
   image-generator
    ```
---

## 🏗 **Deploy and Run on iExec Stack** 🌍

1️⃣ **Build and Push Image to Docker Hub**  

   ```sh  
   docker build . -t yourdockerhubusername/image-generator:1.0.0 
   docker push yourdockerhubusername/image-generator:1.0.0  
```
2️⃣ **Deploy Your dApp on iExec**  
   Follow the official iExec guide to deploy a TDX dApp:  
   🔗 [Deploy a TDX dApp](https://protocol.docs.iex.ec/for-developers/confidential-computing/create-your-first-sgx-app)  

3️⃣ **Publish a dApp Order**  
   Once deployed, you must publish a dApp order to allow usage:  
   🔗 [Manage App Orders](https://protocol.docs.iex.ec/for-developers/advanced/manage-your-apporders)  

---

## 🔐 **Using Encrypted Dataset**

1️⃣ **Deploy Your encrypted dataset on iExec**  
This PoC uses the **prompt.txt** file as an encrypted dataset. In order to use it, please follow the official iExec guide: 
🔗 [Create Encrypted Dataset](https://protocol.docs.iex.ec/for-developers/confidential-computing/access-confidential-assets/sgx-encrypted-dataset)

2️⃣ **Publish a Dataset Order**  
   Once deployed, you must publish a dataset order to allow usage:  
   🔗 [Manage Dataset Orders](https://protocol.docs.iex.ec/for-developers/advanced/manage-your-datasetorders)    

---

## Run dapp on iExec (only with the iExec SDK 8.13.0-tdx)

- Dapp Address: ```0x5e2fe1de5ba6ab3b809f7f5a43dc3e5f0ef2ce21```

```shell 
    iexec app run --dataset $YOUR_DATASET_ADDRESS --workerpool tdx-labs.pools.iexec.eth --tag tee,tdx 0x5e2fe1de5ba6ab3b809f7f5a43dc3e5f0ef2ce21
```
