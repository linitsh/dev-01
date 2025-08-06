---
title     : Values
tags      : []
categories: []
---
---
### Parameters <a name="rootcontents"></a>
- [Setings](#setings)
- [global](#global)
- [Names](#names)
- [Security](#security)
- [Deployment](#deployment)
  - [Autoscaling](#deploymentautoscaling)
  - [Image](#deploymentimage)
  - [Pod](#deploymentpod)
  - [Container](#deploymentcontainer)
  - [Probes](#deploymentprobes)
  - [Resources](#deploymentresources)
  - [Scheduling](#deploymentscheduling)
  - [Storage](#deploymentstorage)
- [Network](#network)
  - [Service](#networkservice)
  - [Ingress](#networkingress)
    - [Hosts](#networkingresshosts)
- [ServiceAccount](#serviceaccount)
- [Configs](#configs)
- [Redis](#redis)
- [Common](#common)
 <a name="rootcontents"></a>

___
#### [^](#rootcontents)<a name="setings"></a> Setings

no desctiption.

| Name            | Description | Value   |
| --------------- | ----------- | ------- |
| `Setings.debug` |             | `false` |

___
#### [^](#rootcontents)<a name="global"></a> global

no desctiption.

| Name          | Description | Value  |
| ------------- | ----------- | ------ |
| `global.some` |             | `true` |

___
#### [^](#rootcontents)<a name="names"></a> Names

no desctiption.

| Name                       | Description | Value |
| -------------------------- | ----------- | ----- |
| `Names.override`           |             |       |
| `Names.override.name`      |             | `""`  |
| `Names.override.fullname`  |             | `""`  |
| `Names.override.namespace` |             | `""`  |

___
#### [^](#rootcontents)<a name="security"></a> Security

no desctiption.

| Name               | Description | Value   |
| ------------------ | ----------- | ------- |
| `Security.include` |             | `false` |

___
#### [^](#rootcontents)<a name="deployment"></a> Deployment

no desctiption.

| Name                  | Description | Value   |
| --------------------- | ----------- | ------- |
| `Deployment.test`     |             | `false` |
| `Deployment.replicas` |             | `1`     |

___
#### [^](#rootcontents)<a name="deploymentautoscaling"></a> Deployment.Autoscaling - ``

| Name                                                    | Description | Value   |
| ------------------------------------------------------- | ----------- | ------- |
| `Deployment.Autoscaling.enabled`                        |             | `false` |
| `Deployment.Autoscaling.minReplicas`                    |             | `1`     |
| `Deployment.Autoscaling.maxReplicas`                    |             | `100`   |
| `Deployment.Autoscaling.targetCPUUtilizationPercentage` |             | `80`    |

___
#### [^](#rootcontents)<a name="deploymentimage"></a> Deployment.Image - ``

| Name                                   | Description | Value          |
| -------------------------------------- | ----------- | -------------- |
| `Deployment.Image.repository`          |             | `nginx`        |
| `Deployment.Image.tag`                 |             | `""`           |
| `Deployment.Image.pullPolicy`          |             | `IfNotPresent` |
| `Deployment.Image.pullSecrets`         |             |                |
| `Deployment.Image.pullSecrets[0].name` |             | `regcred`      |

___
#### [^](#rootcontents)<a name="deploymentpod"></a> Deployment.Pod - ``

| Name                             | Description | Value            |
| -------------------------------- | ----------- | ---------------- |
| `Deployment.Pod.annotations`     |             |                  |
| `Deployment.Pod.annotations.i`   |             | `pod-annotation` |
| `Deployment.Pod.labels`          |             |                  |
| `Deployment.Pod.labels.i`        |             | `pod-label`      |
| `Deployment.Pod.securityContext` |             | `{}`             |

___
#### [^](#rootcontents)<a name="deploymentcontainer"></a> Deployment.Container - ``

| Name                                   | Description | Value |
| -------------------------------------- | ----------- | ----- |
| `Deployment.Container.securityContext` |             | `{}`  |

___
#### [^](#rootcontents)<a name="deploymentprobes"></a> Deployment.Probes - ``

| Name                                            | Description | Value  |
| ----------------------------------------------- | ----------- | ------ |
| `Deployment.Probes.readinessProbe`              |             |        |
| `Deployment.Probes.readinessProbe.httpGet`      |             |        |
| `Deployment.Probes.readinessProbe.httpGet.path` |             | `/`    |
| `Deployment.Probes.readinessProbe.httpGet.port` |             | `http` |

___
#### [^](#rootcontents)<a name="deploymentresources"></a> Deployment.Resources - ``

| Name                                   | Description | Value   |
| -------------------------------------- | ----------- | ------- |
| `Deployment.Resources.limits`          |             |         |
| `Deployment.Resources.limits.cpu`      |             | `100m`  |
| `Deployment.Resources.limits.memory`   |             | `128Mi` |
| `Deployment.Resources.requests`        |             |         |
| `Deployment.Resources.requests.cpu`    |             | `100m`  |
| `Deployment.Resources.requests.memory` |             | `128Mi` |

___
#### [^](#rootcontents)<a name="deploymentscheduling"></a> Deployment.Scheduling - ``

| Name                                 | Description | Value |
| ------------------------------------ | ----------- | ----- |
| `Deployment.Scheduling.nodeSelector` |             | `{}`  |
| `Deployment.Scheduling.affinity`     |             | `{}`  |
| `Deployment.Scheduling.tolerations`  |             | `[]`  |

___
#### [^](#rootcontents)<a name="deploymentstorage"></a> Deployment.Storage - ``

| Name                         | Description | Value |
| ---------------------------- | ----------- | ----- |
| `Deployment.Storage.mounts`  |             | `[]`  |
| `Deployment.Storage.volumes` |             | `[]`  |

___
#### [^](#rootcontents)<a name="network"></a> Network

no desctiption.

| Name              | Description | Value  |
| ----------------- | ----------- | ------ |
| `Network.include` |             | `true` |

___
#### [^](#rootcontents)<a name="networkservice"></a> Network.Service - ``

| Name                   | Description | Value       |
| ---------------------- | ----------- | ----------- |
| `Network.Service.type` |             | `ClusterIP` |
| `Network.Service.port` |             | `80`        |

___
#### [^](#rootcontents)<a name="networkingress"></a> Network.Ingress - ``

| Name                          | Description | Value  |
| ----------------------------- | ----------- | ------ |
| `Network.Ingress.enabled`     |             | `true` |
| `Network.Ingress.className`   |             | `""`   |
| `Network.Ingress.annotations` |             | `{}`   |

___
#### [^](#rootcontents)<a name="networkingresshosts"></a> Network.Ingress.Hosts - ``

| Name                                         | Description | Value                    |
| -------------------------------------------- | ----------- | ------------------------ |
| `Network.Ingress.Hosts[0].host`              |             | `testy.loc`              |
| `Network.Ingress.Hosts[0].paths`             |             |                          |
| `Network.Ingress.Hosts[0].paths[0].path`     |             | `/`                      |
| `Network.Ingress.Hosts[0].paths[0].pathType` |             | `ImplementationSpecific` |
| `Network.Ingress.tls`                        |             | `[]`                     |

___
#### [^](#rootcontents)<a name="serviceaccount"></a> ServiceAccount

no desctiption.

| Name                         | Description | Value   |
| ---------------------------- | ----------- | ------- |
| `ServiceAccount.include`     |             | `false` |
| `ServiceAccount.name`        |             | `""`    |
| `ServiceAccount.automount`   |             | `true`  |
| `ServiceAccount.annotations` |             | `{}`    |

___
#### [^](#rootcontents)<a name="configs"></a> Configs

no desctiption.

| Name                         | Description | Value                      |
| ---------------------------- | ----------- | -------------------------- |
| `Configs.include`            |             | `false`                    |
| `Configs.files`              |             |                            |
| `Configs.files.default_conf` |             | `# inserted by --set-file` |
| `Configs.files.index_html`   |             | `# inserted by --set-file` |
| `Configs.files.50x_html`     |             | `# inserted by --set-file` |

___
#### [^](#rootcontents)<a name="redis"></a> Redis [object]


___
#### [^](#rootcontents)<a name="common"></a> Common [object]


