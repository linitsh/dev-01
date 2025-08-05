{{/*
Returns true if PodSecurityPolicy is supported
*/}}
{{- define "_.capabilities.psp.supported" -}}
{{- $kubeVersion := include "_.capabilities.kubeVersion" . -}}
{{- if or (empty $kubeVersion) (semverCompare "<1.25-0" $kubeVersion) -}}
  {{- true -}}
{{- end -}}
{{- end -}}
