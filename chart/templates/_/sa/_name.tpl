{{/*
* Service Account (sa)
* include names
*/}}


{{/* Create the name of the service account to use */}}
{{- define "_.sa.name" -}}
    {{- if .Values.ServiceAccount.create }}
        {{- default (include "_.names.fullname" .) .Values.ServiceAccount.name }}
    {{- else }}
        {{- default "default" .Values.ServiceAccount.name }}
    {{- end }}
{{- end }}
