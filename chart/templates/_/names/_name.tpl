

{{/* Expand the name of the chart. */}}
{{- define "_.names.name" -}}
    {{- default .Chart.Name .Values.Names.override.name | trunc 63 | trimSuffix "-" }}
{{- end }}

