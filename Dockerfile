FROM nvidia/cuda:11.8.0-runtime-ubuntu20.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa -y \
    && apt-get update && apt-get install -y \
    python3.11 \
    python3.11-dev \
    python3.11-distutils \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11

RUN pip install torch==2.1.0+cu118 torchvision==0.16.0+cu118 torchaudio==2.1.0+cu118 -f https://download.pytorch.org/whl/torch_stable.html

RUN pip install matplotlib
RUN pip install scikit-image
RUN pip install opencv-python
RUN pip install yacs
RUN pip install joblib 
RUN pip install natsort 
RUN pip install h5py 
RUN pip install tqdm
RUN pip install einops
RUN pip install linformer
RUN pip install timm
RUN pip install ptflops
RUN pip install dataclasses
RUN pip install scikit-learn
RUN pip install numpy==1.26.4
RUN pip install natten==0.15.1+torch210cu118 -f https://shi-labs.com/natten/wheels/
RUN pip install -U fvcore

RUN pip install --upgrade pip setuptools wheel

RUN apt-get update && apt-get install -y libgl1-mesa-glx

COPY . /app
WORKDIR /app

CMD [ "python3.11", "test.py", "--input_dir", "./data", "--weights", "./checkpoint/SRD.pth", "--result_dir", "./results", "--ex_name", "name", "--save_images" ]
