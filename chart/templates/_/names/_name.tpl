{{/* Docs
name  : _.names.name
type  : key
desc  :
- Expand the name of the chart.
use   : []
params: []
values: [ .Chart.Name , .Values.Names.override.name ]
examples: 
- simple: |-
    key : {{ include "_.names.name" . }}
  result: |-
    key : chart
*/}}

{{- define "_.names.name" -}}
    {{- default .Chart.Name .Values.Names.override.name | trunc 63 | trimSuffix "-" }}
{{- end }}

