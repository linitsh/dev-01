
{{/*
Generate secret key.

Usage:
{{ include "_.secrets.key" (dict "existingSecret" .Values.path.to.the.existingSecret "key" "keyName") }}

Params:
  - existingSecret - ExistingSecret/String - Optional. The path to the existing secrets in the values.yaml given by the user
    to be used instead of the default one. Allows for it to be of type String (just the secret name) for backwards compatibility.
    +info: https://github.com/bitnami/charts/tree/main/bitnami/common#existingsecret
  - key - String - Required. Name of the key in the secret.
*/}}
{{- define "_.secrets.key" -}}
{{- $key := .key -}}

{{- if .existingSecret -}}
  {{- if not (typeIs "string" .existingSecret) -}}
    {{- if .existingSecret.keyMapping -}}
      {{- $key = index .existingSecret.keyMapping $.key -}}
    {{- end -}}
  {{- end }}
{{- end -}}

{{- printf "%s" $key -}}
{{- end -}}
