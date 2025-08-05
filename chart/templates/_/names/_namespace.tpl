{{/* =:
- Allow the release namespace to be overridden for multi-namespace deployments in combined charts.
uselib: []
values: [ Values.Names.override.namespace , Release.Namespace ]
params: []
examples: 
- simple: |-
    key : {{ include "_.names.namespace" . }}
  result: |-
    key : default
*/}}

{{- define "_.names.namespace" -}}
    {{- default .Release.Namespace .Values.Names.override.namespace | trunc 63 | trimSuffix "-" -}}
{{- end -}}
