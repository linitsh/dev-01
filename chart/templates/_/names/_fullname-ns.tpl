{{/* Docs
name  : _.names.fullname-namespace
type  : key
desc  :
- Create a fully qualified app name adding the installation's namespace.
use   : [ names ]
params: []
values: []
examples: 
- simple: |-
    key : {{ include "_.names.fullname-namespace" . }}
  result: |-
    key : test-chart-default
*/}}

{{- define "_.names.fullname-namespace" -}}
    {{- printf "%s-%s" (include "_.names.fullname" .) (include "_.names.namespace" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
