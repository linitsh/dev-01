

{{/*
Returns whether a previous generated secret already exists

Usage:
{{ include "_.secrets.exists" (dict "secret" "secret-name" "context" $) }}

Params:
  - secret - String - Required - Name of the 'Secret' resource where the password is stored.
  - context - Context - Required - Parent context.
*/}}
{{- define "_.secrets.exists" -}}
{{- $secret := (lookup "v1" "Secret" (include "_.names.namespace" .context) .secret) }}
{{- if $secret }}
  {{- true -}}
{{- end -}}
{{- end -}}
