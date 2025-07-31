{{/*
Allow the release namespace to be overridden for multi-namespace deployments in combined charts.
*/}}
{{- define "names.namespace" -}}
    {{- default .Release.Namespace .Values.names.override.namespace | trunc 63 | trimSuffix "-" -}}
{{- end -}}
