{{/*
Allow the release namespace to be overridden for multi-namespace deployments in combined charts.
*/}}
{{- define "_.names.namespace" -}}
    {{- default .Release.Namespace .Values.Names.override.namespace | trunc 63 | trimSuffix "-" -}}
{{- end -}}
