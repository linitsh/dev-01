{{/* Docs
name  : _.names.fullname
type  : key
desc  :
- Create a default fully qualified dependency name.
- We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
- If release name contains chart name it will be used as a full name.
use   : []
params: [ chartName , chartValues ]
values: [ subchart-values ]
examples: 
- simple: |-
    key : {{ include "_.names.dependency.fullname" (dict "chartName" "redis" "chartValues" .Values.redis "context" $) }}
  result: |-
    key : test-chart-redis
*/}}

{{- define "_.names.dependency.fullname" -}}

    {{- if .chartValues.fullnameOverride -}}

        {{- .chartValues.fullnameOverride | trunc 63 | trimSuffix "-" -}}

    {{- else -}}

        {{- $name := default .chartName .chartValues.nameOverride -}}
        
        {{- if contains $name .context.Release.Name -}}

            {{- .context.Release.Name | trunc 63 | trimSuffix "-" -}}
        
        {{- else -}}
        
            {{- printf "%s-%s" .context.Release.Name $name | trunc 63 | trimSuffix "-" -}}
        
        {{- end -}}

    {{- end -}}

{{- end -}}
