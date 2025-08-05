{{/*
Warning about replaced images from the original.
Usage:
{{ include "_.warnings.modifiedImages" (dict "images" (list .Values.path.to.the.imageRoot) "context" $) }}
*/}}
{{- define "_.warnings.modifiedImages" -}}
{{- $affectedImages := list -}}
{{- $printMessage := false -}}
{{- $originalImages := .context.Chart.Annotations.images -}}
{{- range .images -}}
  {{- $fullImageName := printf (printf "%s/%s:%s" .registry .repository .tag) -}}
  {{- if not (contains $fullImageName $originalImages) }}
    {{- $affectedImages = append $affectedImages (printf "%s/%s:%s" .registry .repository .tag) -}}
    {{- $printMessage = true -}}
  {{- end -}}
{{- end -}}
{{- if $printMessage }}

⚠ SECURITY WARNING: Original containers have been substituted. This Helm chart was designed, tested, and validated on multiple platforms using a specific set of Bitnami and Tanzu Application Catalog containers. Substituting other containers is likely to cause degraded security and performance, broken chart features, and missing environment variables.

Substituted images detected:
{{- range $affectedImages }}
  - {{ . }}
{{- end }}
{{- end -}}
{{- end -}}
