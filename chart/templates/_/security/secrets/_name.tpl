
{{/*
Generate secret name.

Usage:
{{ include "_.secrets.name" (dict "existingSecret" .Values.path.to.the.existingSecret "defaultNameSuffix" "mySuffix" "context" $) }}

Params:
  - existingSecret - ExistingSecret/String - Optional. The path to the existing secrets in the values.yaml given by the user
    to be used instead of the default one. Allows for it to be of type String (just the secret name) for backwards compatibility.
    +info: https://github.com/bitnami/charts/tree/main/bitnami/common#existingsecret
  - defaultNameSuffix - String - Optional. It is used only if we have several secrets in the same deployment.
  - context - Dict - Required. The context for the template evaluation.
*/}}
{{- define "_.secrets.name" -}}
{{- $name := (include "_.names.fullname" .context) -}}

{{- if .defaultNameSuffix -}}
{{- $name = printf "%s-%s" $name .defaultNameSuffix | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- with .existingSecret -}}
{{- if not (typeIs "string" .) -}}
{{- with .name -}}
{{- $name = . -}}
{{- end -}}
{{- else -}}
{{- $name = . -}}
{{- end -}}
{{- end -}}

{{- printf "%s" $name -}}
{{- end -}}
