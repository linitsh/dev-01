{{/* Docs
desc  :
- Expand the name of the chart.
uselib: []
values: [ Chart.Name , Values.Names.override.name ]
params: []
examples: 
- simple: |-
    key : {{ include "_.names.name" . }}
  result: |-
    key : chart
*/}}

{{- define "_.names.name" -}}
    {{- default .Chart.Name .Values.Names.override.name | trunc 63 | trimSuffix "-" }}
{{- end }}

