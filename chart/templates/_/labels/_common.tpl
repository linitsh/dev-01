{{/*  
include names
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
