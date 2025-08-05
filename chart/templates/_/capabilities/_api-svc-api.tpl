

{{/*
Return the appropriate apiVersion for APIService.
*/}}
{{- define "_.capabilities.apiService.apiVersion" -}}
{{- $kubeVersion := include "_.capabilities.kubeVersion" . -}}
{{- if and (not (empty $kubeVersion)) (semverCompare "<1.10-0" $kubeVersion) -}}
{{- print "apiregistration.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "apiregistration.k8s.io/v1" -}}
{{- end -}}
{{- end -}}

