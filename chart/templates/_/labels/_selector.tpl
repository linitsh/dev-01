{{/*  
include names
*/}}

{{/* Selector labels */}}
{{- define "_.labels.selector" -}}
app.kubernetes.io/name: {{ include  "_.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}