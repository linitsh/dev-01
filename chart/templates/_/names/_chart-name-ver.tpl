{{/* Docs
name  : _.names.chart-name-version
type  : key
desc  :
- Create chart name and version as used by the chart label. 
use   : []
params: []
values: [ .Chart.Name , .Chart.Version ]
examples: 
- simple: |-
    key: {{ include "_.names.chart-name-version . }}
  result: |-
    key: chart-0.1.0
*/}}

{{- define "_.names.chart-name-version" -}}
    {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


