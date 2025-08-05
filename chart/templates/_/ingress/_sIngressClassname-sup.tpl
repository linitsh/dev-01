
{{/*
Returns true if the ingressClassname field is supported
Usage:
{{ include "_.ingress.supportsIngressClassname" . }}
*/}}
{{- define "_.ingress.supportsIngressClassname" -}}
{{- if semverCompare "<1.18-0" (include "_.capabilities.kubeVersion" .) -}}
{{- print "false" -}}
{{- else -}}
{{- print "true" -}}
{{- end -}}
{{- end -}}
