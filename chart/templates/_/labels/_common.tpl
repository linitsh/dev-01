{{/* Docs
desciption:
- Generate common labels for any.
usage: 'labels: > {{- include "_.labels.common" . \| nindent [n] }}'
type: object-props
use: 
- _.names.chartNameVersion
- _.labels.selector
params: []
values: 
- .Chart.AppVersion
- .Chart.AppVersion
- .Release.Service
examples: 
- simple: |
    metadata:
      labels:
        {{- include "_.labels.common" . | nindent 8 }}
*/}}

{{/* Common labels */}}
{{- define "_.labels.common" -}}
helm.sh/chart: {{ include "_.names.chartNameVersion" . }}
{{ include "_.labels.selector" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
