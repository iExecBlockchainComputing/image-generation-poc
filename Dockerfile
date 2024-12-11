FROM ubuntu:20.04

# Install essential packages and add deadsnakes PPA for newer Python versions
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       software-properties-common \
       curl \
       unzip \
       ca-certificates \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y python3.9 python3.9-distutils python3.9-venv \
    && apt-get install -y python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Set Python3.9 as the default Python and upgrade pip
RUN ln -sf /usr/bin/python3.9 /usr/bin/python \
    && python -m ensurepip --upgrade \
    && python -m pip install --upgrade pip

# Download and install custom huggingface_hub library
RUN curl -L -o huggingface_hub.zip https://github.com/iExecBlockchainComputing/huggingface_hub/archive/refs/heads/main.zip \
    && unzip huggingface_hub.zip \
    && rm huggingface_hub.zip \
    && pip install ./huggingface_hub-main

# Download and install custom transformers library
RUN curl -L -o transformers.zip https://github.com/iExecBlockchainComputing/transformers/archive/refs/heads/main.zip \
    && unzip transformers.zip \
    && rm transformers.zip \
    && pip install ./transformers-main

# Install PyTorch and other dependencies
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu \
    && pip install diffusers \
    && pip install accelerate

# Copy your application code into the container
COPY ./src /app

# Define the entrypoint for the container
ENTRYPOINT ["python", "/app/main.py"]
