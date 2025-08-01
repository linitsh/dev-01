{{/*  
include names
*/}}

{{/* Selector labels */}}
{{- define "labels.selector" -}}
app.kubernetes.io/name: {{ include  "names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}