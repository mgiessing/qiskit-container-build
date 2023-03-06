ARG ROOT_IMAGE=continuumio/miniconda3

FROM ${ROOT_IMAGE}

ARG PYTHON_VERSION=3.9
ARG QISKIT_VERSION=0.41.1

RUN conda install -n base -y \
    python=${PYTHON_VERSION} \
    cryptography \
    h5py \
    numpy \
    lxml \
    matplotlib \
    pandas \
    psutil \
    pyzmq \
    scipy \
    scikit-learn && \
    conda clean --all --yes && \
    pip3 install --no-cache qiskit['all']==${QISKIT_VERSION}
