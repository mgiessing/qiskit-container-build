ARG ROOT_IMAGE=continuumio/miniconda3

FROM ${ROOT_IMAGE}

ARG PYTHON_VERSION=3.9
ARG QISKIT_VERSION=latest

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
    scikit-learn 
    jupyterlab \
    ipywidgets && \
    conda clean --all --yes && \
    pip3 install --extra-index-url https://repo.fury.io/mgiessing --no-cache qiskit['all']==${QISKIT_VERSION}

ENV PATH=${PATH}:/opt/conda/bin

RUN mkdir -p /tmp/notebooks && chmod -R a+rwx /tmp/notebooks
ENTRYPOINT ["sh", "-c", "jupyter lab --notebook-dir=/tmp/notebooks --no-browser --ip=0.0.0.0 --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.allow_origin='*'"]
