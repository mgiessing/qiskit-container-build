# Qiskit container images

This repository provides container images for the Python framework [Qiskit](https://qiskit.org/)

Images are available on [quay.io](https://quay.io/mgiessing/qiskit)


The container images are available as multi-arch, currently supporting:
- x86_64 (Intel/AMD)
- ppc64le (IBM PowerPC)
- s390x (IBM Z)

## Using images

Prerequisites are:
- Container engine (e.g. docker or podman)

### Pure Python

Start the interactive python shell
`docker run -ti --rm quay.io/mgiessing/qiskit:0.41.1`

```bash
(base) root@c21e1f3cd2af:/# python
>>> import qiskit
>>> qiskit.__qiskit_version__
{'qiskit-terra': '0.23.2', 'qiskit-aer': '0.11.2', 'qiskit-ignis': None, 'qiskit-ibmq-provider': '0.20.1', 'qiskit': '0.41.1', 'qiskit-nature': '0.5.2', 'qiskit-finance': '0.3.4', 'qiskit-optimization': '0.5.0', 'qiskit-machine-learning': '0.5.0'}
```

### Jupyter Lab

`docker run -ti -p 8888:8888 --rm quay.io/mgiessing/qiskit:0.41.1-jupyter`

Jupyter can then be accessed in browser.

## Build images

Clone git repository

```bash
git clone https://github.com/mgiessing/qiskit-container-build
cd qiskit-container-build
```

Images can be build using buildx (multiarch)

```bash
#Python image
make build-base

#Jupyter image
make build-jupyter
```

Images for the native arch can be build using 

```bash
#Python image
make build-local

#Jupyter image
make build-local-jupyter
```

### Build for armv7l (e.g. Raspberry Pi 32bit)

For armv7l there is no up-to-date conda image, instead piwheels is used and therefore a different dockerfile/approach

```bash
make build-armv7l
```
