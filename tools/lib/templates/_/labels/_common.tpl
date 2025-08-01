{{/*  
include names
*/}}

{{/* Common labels */}}
{{- define "labels.common" -}}
helm.sh/chart: {{ include "names.chartNameVersion" . }}
{{ include "labels.selector" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
