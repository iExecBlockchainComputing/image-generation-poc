FROM ubuntu:20.04

# Install essential packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    && apt-get install -y curl unzip \
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh \
    && bash Miniconda3-py38_4.10.3-Linux-x86_64.sh -b -p /root/miniconda

# Configure Conda environment
ENV CONDA_AUTO_UPDATE_CONDA="false"
ENV PATH=/root/miniconda/bin:$PATH
ENV SCONE_PWD=PATH

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

# Create a custom directory for PyTorch and install it there
RUN /root/miniconda/bin/pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu 

RUN /root/miniconda/bin/pip install diffusers 

RUN /root/miniconda/bin/pip install accelerate

# Copy your application code into the container
COPY ./src /app

# Define the entrypoint for the container
ENTRYPOINT ["/root/miniconda/bin/python3.8", "/app/main.py"]
