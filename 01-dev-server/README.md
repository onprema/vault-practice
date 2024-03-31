# 01-dev-server

Start a dev server:
```bash
vault server -dev
```
- Everything in the dev server is stored in memory.
- It'll be easier to run `export VAULT_ADDR='http://127.0.0.1:8200'` before you run `vault` CLI commands.
- You can also hit the API using `curl $VAULT_ADDR/sys/init`, for example

When `vault` starts up, it logs
> 2024-03-31T01:00:12.929Z [INFO]  core: successful mount: namespace="" path=secret/ type=kv version="v0.17.0+builtin"

This shows that a _secrets engine_ (aka "mount point") was automatically created, called `secret`

Add a secret to vault:
```bash
vault kv put -mount=secret my_secret message="sssh!"
```

Get a secret from vault:
```bash
vault kv get -mount=secret my_secret
```

List all secrets:
```bash
vault kv list secret/
```

Delete a secret: delete the data of a secret but not the actual secret, which has versioning enabled.
```bash
vault kv delete -mount=secret my_secret
```

Undelete a secret: restore the data of the secret
```bash
vault kv undelete -mount=secret -versions=1 my_secret
```