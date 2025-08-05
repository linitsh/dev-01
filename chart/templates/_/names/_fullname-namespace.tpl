
{{/*
Create a fully qualified app name adding the installation's namespace.
*/}}
{{- define "_.names.fullname-namespace" -}}
{{- printf "%s-%s" (include "_.names.fullname" .) (include "_.names.namespace" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
