FROM cgr.dev/chainguard/wolfi-base as builder
ENV VAULT_VERSION=1.16.0
WORKDIR /vault
RUN apk update && apk add curl unzip
RUN curl https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip -o vault_1.16.0_linux_amd64.zip
RUN unzip vault_1.16.0_linux_amd64.zip

FROM cgr.dev/chainguard/wolfi-base
WORKDIR /code
EXPOSE 8200
ENV VAULT_ADDR='http://127.0.0.1:8200'
COPY --from=builder /vault/vault /usr/local/bin/