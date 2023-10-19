ARG ROOT_IMAGE=mambaorg/micromamba

FROM ${ROOT_IMAGE}

ARG PYTHON_VERSION=3.10
ARG QISKIT_VERSION=0.42.0

RUN micromamba config append channels rocketce && \
    micromamba config append channels defaults && \
    micromamba install -n base -y \
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
    scikit-learn \ 
    jupyterlab \
    ipywidgets && \
    micromamba clean --all --yes

ARG MAMBA_DOCKERFILE_ACTIVATE=1
ENV PATH=${PATH}:/opt/conda/bin \
    HOME=/home/mambauser
RUN pip3 install --no-cache qiskit['all']==${QISKIT_VERSION} && \
    mkdir -p /tmp/notebooks && chmod -R a+rwx /tmp/notebooks

ENTRYPOINT ["sh", "-c", "jupyter lab --notebook-dir=/tmp/notebooks --no-browser --ip=0.0.0.0 --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.allow_origin='*'"]
