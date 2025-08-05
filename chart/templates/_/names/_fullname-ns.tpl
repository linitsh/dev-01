{{/* Docs
desc  :
- Create a fully qualified app name adding the installation's namespace.
uselib: [ names ]
values: []
params: []
examples: 
- simple: |-
    key : {{ include "_.names.fullname-namespace" . }}
  result: |-
    key : test-chart-default
*/}}

{{- define "_.names.fullname-namespace" -}}
    {{- printf "%s-%s" (include "_.names.fullname" .) (include "_.names.namespace" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
