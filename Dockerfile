
FROM python:3.9

WORKDIR /app

RUN apt-get update && apt-get install -y wget && \
    wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-latest-Linux-x86_64.sh

ENV PATH /opt/conda/bin:$PATH

COPY requirements.txt .

RUN conda clean --all

RUN conda install -y jupyter

RUN pip install pip --upgrade && pip install -r requirements.txt

COPY . .
