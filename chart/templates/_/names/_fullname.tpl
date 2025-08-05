{{/* =:
- Create a default fully qualified app name.
- We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
- If release name contains chart name it will be used as a full name.
uselib: []
values: [ Chart.Name , Release.Name , Values.Names.override.fullname , Values.Names.override.name ]
params: []
examples: 
- simple: |-
    key : {{ include "_.names.fullname" . }}
  result: |-
    key : test-chart
*/}}

{{- define "_.names.fullname" -}}

    {{- if .Values.Names.override.fullname }}

        {{- .Values.Names.override.fullname | trunc 63 | trimSuffix "-" }}

    {{- else }}

        {{- $name := default .Chart.Name .Values.Names.override.name }}

        {{- if contains $name .Release.Name }}
            {{- .Release.Name | trunc 63 | trimSuffix "-" }}
        {{- else }}
            {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
        {{- end }}

    {{- end }}

{{- end -}}
