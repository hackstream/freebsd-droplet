# Droplet Infra

Uses DigitalOcean Terraform provider to provision resources for running a FreeBSD 12.1 server.

## Getting Started

**Note**: Before you begin, export API token for performing any kind of ops with DO API:

```sh
export DIGITALOCEAN_TOKEN=<>
```

### Initialising state

```shell
terraform init
```

### Applying changes

```shell
terraform plan
terraform apply
```
