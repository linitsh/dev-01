

{{/*
Print "true" if the API pathType field is supported
Usage:
{{ include "_.ingress.supportsPathType" . }}
*/}}
{{- define "_.ingress.supportsPathType" -}}
{{- if (semverCompare "<1.18-0" (include "_.capabilities.kubeVersion" .)) -}}
{{- print "false" -}}
{{- else -}}
{{- print "true" -}}
{{- end -}}
{{- end -}}
