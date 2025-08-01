---
title     : Values
tags      : []
categories: []
---
---
### Parameters

#### main

| Name               | Description | Value |
| ------------------ | ----------- | ----- |
| `nameOverride`     |             | `""`  |
| `fullnameOverride` |             | `""`  |

#### deployment

| Name                 | Description                                                    | Value                          |
| -------------------- | -------------------------------------------------------------- | ------------------------------ |
| `replicaCount`       | This will set the replicaset count                             | `1`                            |
| `image.repository`   | Image name                                                     | `REPOSITORY_NAME/<image name>` |
| `image.tag`          | Overrides the image tag whose default is the chart appVersion. | `""`                           |
| `image.pullPolicy`   | Sets the pull policy for images.                               | `IfNotPresent`                 |
| `imagePullSecrets`   | Specify docker-registry secret names as an array               | `[]`                           |
| `livenessProbe`      | livenessProbe                                                  | `{}`                           |
| `readinessProbe`     | readinessProbe                                                 | `{}`                           |
| `volumes`            | Additional volumes on the output Deployment definition.        | `[]`                           |
| `volumeMounts`       | Additional volumeMounts on the output Deployment definition.   | `[]`                           |
| `nodeSelector`       |                                                                | `{}`                           |
| `tolerations`        |                                                                | `[]`                           |
| `affinity`           |                                                                | `{}`                           |
| `podAnnotations`     |                                                                | `{}`                           |
| `podLabels`          |                                                                | `{}`                           |
| `podSecurityContext` |                                                                | `{}`                           |
| `securityContext`    |                                                                | `{}`                           |

#### serviceAccount

| Name                         | Description                                                | Value   |
| ---------------------------- | ---------------------------------------------------------- | ------- |
| `serviceAccount.create`      | Enable the creation of a ServiceAccount for Kubewatch pods | `false` |
| `serviceAccount.automount`   | Automatically mount a ServiceAccount's API credentials?    | `true`  |
| `serviceAccount.annotations` | Annotations to add to the service account                  | `{}`    |
| `serviceAccount.name`        | Name of the created ServiceAccount                         | `""`    |

#### service

| Name           | Description                        | Value       |
| -------------- | ---------------------------------- | ----------- |
| `service.type` | The Kubernetes type of the service | `ClusterIP` |
| `service.port` | The port of the service            | `80`        |

#### ingress

| Name                  | Description | Value   |
| --------------------- | ----------- | ------- |
| `ingress.enabled`     |             | `false` |
| `ingress.className`   |             | `""`    |
| `ingress.annotations` |             | `{}`    |
| `ingress.hosts`       |             | `[]`    |
| `ingress.tls`         |             | `[]`    |

#### ConfigMap

| Name       | Description                                      | Value |
| ---------- | ------------------------------------------------ | ----- |
| `cfmFiles` | list of ConfigMap files included by `--set-file` | `{}`  |

#### secrets

| Name          | Description                | Value  |
| ------------- | -------------------------- | ------ |
| `sec.enabled` | Enable the security module | `true` |

#### subchart.redis

| Name            | Description               | Value   |
| --------------- | ------------------------- | ------- |
| `redis.enabled` | Enable the redis subchart | `false` |

