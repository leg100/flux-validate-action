FROM alpine:3.15

ENV KUSTOMIZE_VERSION 5.6.0
ENV KUBECONFORM_VERSION 0.7.0

RUN apk --no-cache add bash curl yq

RUN curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz | tar xvz -C /usr/local/bin kustomize

RUN curl -L https://github.com/yannh/kubeconform/releases/download/v${KUBECONFORM_VERSION}/kubeconform-linux-amd64.tar.gz | tar xvz -C /usr/local/bin kubeconform

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
