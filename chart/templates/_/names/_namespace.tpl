{{/* Docs
name  : _.names.namespace
type  : key
desc  :
- Allow the release namespace to be overridden for multi-namespace deployments in combined charts.
use   : []
params: []
values: [ .Values.Names.override.namespace , .Release.Namespace ]
examples: 
- simple: |-
    key : {{ include "_.names.namespace" . }}
  result: |-
    key : default
*/}}

{{- define "_.names.namespace" -}}
    {{- default .Release.Namespace .Values.Names.override.namespace | trunc 63 | trimSuffix "-" -}}
{{- end -}}
