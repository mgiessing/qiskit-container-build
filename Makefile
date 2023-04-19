DOCKER_CMD?=docker buildx build #docker buildx

REPO=quay.io/mgiessing
IMAGE=qiskit

ROOT_IMAGE?=continuumio/miniconda3
PYTHON_VERSION?=3.9
QISKIT_VERSION?=0.42.1


PLATFORMS?=linux/amd64,linux/ppc64le,linux/s390x,linux/arm64

build-base:
	${DOCKER_CMD} --push \
	--platform ${PLATFORMS} \
	--build-arg PYTHON_VERSION=${PYTHON_VERSION} \
	--build-arg ROOT_IMAGE=${ROOT_IMAGE} \
	--build-arg QISKIT_VERSION=${QISKIT_VERSION} \
	-t ${REPO}/${IMAGE}:${QISKIT_VERSION} \
	-f dockerfiles/Dockerfile .


build-jupyter: build-base
	${DOCKER_CMD} --push \
        --platform ${PLATFORMS} \
	--build-arg BASE_IMG=${REPO}/${IMAGE}:${QISKIT_VERSION} \
	-t ${REPO}/${IMAGE}:${QISKIT_VERSION}-jupyter \
	-f dockerfiles/Dockerfile.jupyter .

build-local:
	docker build \
        --build-arg PYTHON_VERSION=${PYTHON_VERSION} \
        --build-arg ROOT_IMAGE=${ROOT_IMAGE} \
        --build-arg QISKIT_VERSION=${QISKIT_VERSION} \
        -t ${REPO}/${IMAGE}:${QISKIT_VERSION} \
        -f dockerfiles/Dockerfile .

build-local-jupyter: build-local
	docker build \
        --build-arg BASE_IMG=${REPO}/${IMAGE}:${QISKIT_VERSION} \
        -t ${REPO}/${IMAGE}:${QISKIT_VERSION}-jupyter \
        -f dockerfiles/Dockerfile.jupyter .

#armv7l needs different setup
build-arm7vl:
	${DOCKER_CMD} --push \
	--platform linux/arm/v7 \
	--build-arg QISKIT_VERSION=${QISKIT_VERSION} \
	-t ${REPO}/${IMAGE}:${QISKIT_VERSION}-armv7l \
	-f dockerfiles/Dockerfile.armv7l .
