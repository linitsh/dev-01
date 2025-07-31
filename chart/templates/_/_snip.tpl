{{/*
desciption:
- Create some name
- and here link [git](https://google.com)
includes: 
- names
type    : keyvalue
params  : 
- param1: 'nice param'
values: 
- .Values.names.override.name
usage   : 
- '<key>: {{ include "names.name" <path> }}'
examples: 
- simple:
  metadata:
    name: {{ include "names.name" . }}
*/}}

{{- define "names.name" -}}
  {{- default .Chart.Name .Values.names.override.name | trunc 63 | trimSuffix "-" }}
{{- end }}