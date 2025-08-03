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

#### Deployment.Image - ``

| Name                          | Description | Value          |
| ----------------------------- | ----------- | -------------- |
| `Deployment.Image.repository` |             | `nginx`        |
| `Deployment.Image.pullPolicy` |             | `IfNotPresent` |
| `Deployment.Image.tag`        |             | `""`           |

#### Deployment.Resources - ``


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

