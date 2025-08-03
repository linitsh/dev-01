---
title     : Values
tags      : []
categories: []
---
---
### Parameters

#### <hr/><h3>global</h3>

no desctiption.

| Name          | Description | Value  |
| ------------- | ----------- | ------ |
| `global.some` |             | `true` |

#### <hr/><h3>Names</h3>

no desctiption.

| Name                       | Description | Value |
| -------------------------- | ----------- | ----- |
| `Names.override`           | `{ }`       |       |
| `Names.override.name`      |             | `""`  |
| `Names.override.fullname`  |             | `""`  |
| `Names.override.namespace` |             | `""`  |

#### <hr/><h3>Deployment</h3>

no desctiption.

| Name                      | Description | Value |
| ------------------------- | ----------- | ----- |
| `Deployment.replicaCount` |             | `1`   |

#### Deployment.Autoscaling - ``

| Name                                                    | Description | Value   |
| ------------------------------------------------------- | ----------- | ------- |
| `Deployment.Autoscaling.enabled`                        |             | `false` |
| `Deployment.Autoscaling.minReplicas`                    |             | `1`     |
| `Deployment.Autoscaling.maxReplicas`                    |             | `100`   |
| `Deployment.Autoscaling.targetCPUUtilizationPercentage` |             | `80`    |

#### Deployment.Image - ``

| Name                           | Description | Value          |
| ------------------------------ | ----------- | -------------- |
| `Deployment.Image.pullSecrets` |             | `[]`           |
| `Deployment.Image.repository`  |             | `nginx`        |
| `Deployment.Image.pullPolicy`  |             | `IfNotPresent` |
| `Deployment.Image.tag`         |             | `""`           |

#### Deployment.Pod - ``

| Name                             | Description | Value |
| -------------------------------- | ----------- | ----- |
| `Deployment.Pod.annotations`     |             | `{}`  |
| `Deployment.Pod.labels`          |             | `{}`  |
| `Deployment.Pod.securityContext` |             | `{}`  |

#### Deployment.Container - ``

| Name                                   | Description | Value |
| -------------------------------------- | ----------- | ----- |
| `Deployment.Container.securityContext` |             | `{}`  |

#### Deployment.Probes - ``

| Name                                            | Description | Value  |
| ----------------------------------------------- | ----------- | ------ |
| `Deployment.Probes.livenessProbe`               | `{ }`       |        |
| `Deployment.Probes.livenessProbe.httpGet`       | `{ }`       |        |
| `Deployment.Probes.livenessProbe.httpGet.path`  |             | `/`    |
| `Deployment.Probes.livenessProbe.httpGet.port`  |             | `http` |
| `Deployment.Probes.readinessProbe`              | `{ }`       |        |
| `Deployment.Probes.readinessProbe.httpGet`      | `{ }`       |        |
| `Deployment.Probes.readinessProbe.httpGet.path` |             | `/`    |
| `Deployment.Probes.readinessProbe.httpGet.port` |             | `http` |

#### Deployment.Resources - ``

| Name                                   | Description | Value   |
| -------------------------------------- | ----------- | ------- |
| `Deployment.Resources.limits`          | `{ }`       |         |
| `Deployment.Resources.limits.cpu`      |             | `100m`  |
| `Deployment.Resources.limits.memory`   |             | `128Mi` |
| `Deployment.Resources.requests`        | `{ }`       |         |
| `Deployment.Resources.requests.cpu`    |             | `100m`  |
| `Deployment.Resources.requests.memory` |             | `128Mi` |

#### Deployment.Scheduling - ``

| Name                                 | Description | Value |
| ------------------------------------ | ----------- | ----- |
| `Deployment.Scheduling.nodeSelector` |             | `{}`  |
| `Deployment.Scheduling.affinity`     |             | `{}`  |
| `Deployment.Scheduling.tolerations`  |             | `[]`  |

#### Deployment.Storage - ``

| Name                         | Description | Value |
| ---------------------------- | ----------- | ----- |
| `Deployment.Storage.mounts`  |             | `[]`  |
| `Deployment.Storage.volumes` |             | `[]`  |

#### <hr/><h3>Network</h3>

no desctiption.


#### Network.Service - ``

| Name                   | Description | Value       |
| ---------------------- | ----------- | ----------- |
| `Network.Service.type` |             | `ClusterIP` |
| `Network.Service.port` |             | `80`        |

#### Network.Ingress - ``

| Name                          | Description | Value   |
| ----------------------------- | ----------- | ------- |
| `Network.Ingress.enabled`     |             | `false` |
| `Network.Ingress.className`   |             | `""`    |
| `Network.Ingress.annotations` |             | `{}`    |

#### Network.Ingress.Hosts - ``

| Name                                         | Description | Value                    |
| -------------------------------------------- | ----------- | ------------------------ |
| `Network.Ingress.Hosts[0].host`              |             | `chart-example.local`    |
| `Network.Ingress.Hosts[0].paths`             | `[ ]`       |                          |
| `Network.Ingress.Hosts[0].paths[0].path`     |             | `/`                      |
| `Network.Ingress.Hosts[0].paths[0].pathType` |             | `ImplementationSpecific` |
| `Network.Ingress.tls`                        |             | `[]`                     |

#### <hr/><h3>ServiceAccount</h3>

no desctiption.

| Name                         | Description | Value  |
| ---------------------------- | ----------- | ------ |
| `ServiceAccount.create`      |             | `true` |
| `ServiceAccount.automount`   |             | `true` |
| `ServiceAccount.annotations` |             | `{}`   |
| `ServiceAccount.name`        |             | `""`   |

