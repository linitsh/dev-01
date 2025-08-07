{{/*
Throw error when original container images are replaced.
The error can be bypassed by setting the "global.security.allowInsecureImages" to true. In this case,
a warning message will be shown instead.

Usage:
{{ include "_.errors.insecureImages" (dict "images" (list .Values.path.to.the.imageRoot) "context" $) }}
*/}}
{{- define "_.errors.insecureImages" -}}
{{- $relocatedImages := list -}}
{{- $replacedImages  := list -}}
{{- $retaggedImages  := list -}}
{{- $globalRegistry  := ((.context.Values.global).imageRegistry) -}}
{{- $chartAllowedImages  := .context.Chart.Annotations.allowedImages -}}
{{- range .images -}}
  {{- $registryName := default .registry $globalRegistry -}}
  {{- $fullImageNameNoTag := printf "%s/%s" $registryName .repository -}}
  {{- $fullImageName := printf "%s:%s" $fullImageNameNoTag .tag -}}
  {{- if not (contains $fullImageNameNoTag $chartAllowedImages) -}}
    {{- if not (contains $registryName $chartAllowedImages) -}}
      {{- $relocatedImages = append $relocatedImages $fullImageName  -}}
    {{- else if not (contains .repository $chartAllowedImages) -}}
      {{- $replacedImages = append $replacedImages $fullImageName  -}}
    {{- end -}}
  {{- end -}}
  {{- if not (contains (printf "%s:%s" .repository .tag) $chartAllowedImages) -}}
    {{- $retaggedImages = append $retaggedImages $fullImageName  -}}
  {{- end -}}
{{- end -}}

{{- if and (or (gt (len $relocatedImages) 0) (gt (len $replacedImages) 0)) (((.context.Values.global).security).allowInsecureImages) -}}
  {{- print "\n\n⚠ SECURITY WARNING: Verifying original container images was skipped. Please note this Helm chart was designed, tested, and validated on multiple platforms using a specific set of Bitnami and Tanzu Application Catalog containers. Substituting other containers is likely to cause degraded security and performance, broken chart features, and missing environment variables.\n" -}}
{{- else if (or (gt (len $relocatedImages) 0) (gt (len $replacedImages) 0)) -}}
  {{- $errorString := "Original containers have been substituted for unrecognized ones. Deploying this chart with non-standard containers is likely to cause degraded security and performance, broken chart features, and missing environment variables." -}}
  {{- $errorString = print $errorString "\n\nUnrecognized images:" -}}
  {{- range (concat $relocatedImages $replacedImages) -}}
    {{- $errorString = print $errorString "\n  - " . -}}
  {{- end -}}
  {{- if or (contains "docker.io/bitnami/" $chartAllowedImages) (contains "docker.io/bitnamiprem/" $chartAllowedImages) -}}
    {{- $errorString = print "\n\n⚠ ERROR: " $errorString -}}
    {{- $errorString = print $errorString "\n\nIf you are sure you want to proceed with non-standard containers, you can skip container image verification by setting the global parameter 'global.security.allowInsecureImages' to true." -}}
    {{- $errorString = print $errorString "\nFurther information can be obtained at https://github.com/bitnami/charts/issues/30850" -}}
    {{- print $errorString | fail -}}
  {{- else if gt (len $replacedImages) 0 -}}
    {{- $errorString = print "\n\n⚠ WARNING: " $errorString -}}
    {{- print $errorString -}}
  {{- end -}}
{{- else if gt (len $retaggedImages) 0 -}}
  {{- $warnString := "\n\n⚠ WARNING: Original containers have been retagged. Please note this Helm chart was tested, and validated on multiple platforms using a specific set of Tanzu Application Catalog containers. Substituting original image tags could cause unexpected behavior." -}}
  {{- $warnString = print $warnString "\n\nRetagged images:" -}}
  {{- range $retaggedImages -}}
    {{- $warnString = print $warnString "\n  - " . -}}
  {{- end -}}
  {{- print $warnString -}}
{{- end -}}
{{- end -}}
