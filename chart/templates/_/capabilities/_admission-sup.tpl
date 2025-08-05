{{/*
Returns true if AdmissionConfiguration is supported
*/}}
{{- define "_.capabilities.admissionConfiguration.supported" -}}
{{- $kubeVersion := include "_.capabilities.kubeVersion" . -}}
{{- if or (empty $kubeVersion) (not (semverCompare "<1.23-0" $kubeVersion)) -}}
  {{- true -}}
{{- end -}}
{{- end -}}
