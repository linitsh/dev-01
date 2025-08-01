{{/*
* Service Account (sa)
* include names
*/}}


{{/* Create the name of the service account to use */}}
{{- define "sa.name" -}}
    {{- if .Values.serviceAccount.create }}
        {{- default (include "names.fullname" .) .Values.serviceAccount.name }}
    {{- else }}
        {{- default "default" .Values.serviceAccount.name }}
    {{- end }}
{{- end }}
