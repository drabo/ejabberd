# ejabberd in Kubernetes

## Materials used

### ejabberd Github

https://github.com/processone/ejabberd

### ejabberd Community Server

https://github.com/processone/docker-ejabberd/tree/master/ecs

### ejabberd Community Server Official Docker Image

https://hub.docker.com/r/ejabberd/ecs/tags

### ejabberd Container

https://github.com/processone/ejabberd/blob/master/CONTAINER.md

### Provide out of the box clustering

https://github.com/processone/docker-ejabberd/issues/64

### K8s

https://github.com/Robbilie/kubernetes-ejabberd/blob/main/cluster.sh

https://github.com/processone/docker-ejabberd/issues/64#issuecomment-814310376

### Database settings

https://docs.ejabberd.im/admin/configuration/database/

https://docs.ejabberd.im/admin/configuration/toplevel/#sql-keepalive-interval

## Final solution

Based on cluster start script, thanks to https://github.com/Robbilie/kubernetes-ejabberd

Docker image used: `ejabberd/ecs:22.05`

## Final comments

- The script generate-ejabberd-yaml.sh may be used to create manifests for various environments.
- An AWS NLB will be created by the chart and a DNS record should be created to access the NLB - may be removed if not necessary.
- The annotations in statefulset will provide metrics for Prometheus and preparation for logging in Elasticsearch.
- Config secrets/ejabberd.yml and secrets/.erlang.cookie should be stored encrypted and be decrypted at manifest generation time.
- Istio template included for ejabberd GUI - may be removed if not necessary.
- AWS EFS included for document uploads - may be removed if not necessary.
