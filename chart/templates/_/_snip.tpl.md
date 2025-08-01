{{/* Docs
desciption:
- Create some name
- and here link [git](https://google.com)
usage: '$key: {{ include "names.name" $path }}'
type: keyvalue
use: 
- names
params: 
- param1: nice param
values: 
- .Chart.Name
- .Values.names.override.name
examples: 
- simple: |
    metadata:
      name: {{ include "names.name" . }}
*/}}

{{- define "names.name" -}}
  {{- default .Chart.Name .Values.names.override.name | trunc 63 | trimSuffix "-" }}
{{- end }}
