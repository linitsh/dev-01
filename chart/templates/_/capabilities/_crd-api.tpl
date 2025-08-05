{{/*
Return the appropriate apiVersion for CRDs.
*/}}
{{- define "_.capabilities.crd.apiVersion" -}}
{{- $kubeVersion := include "_.capabilities.kubeVersion" . -}}
{{- if and (not (empty $kubeVersion)) (semverCompare "<1.19-0" $kubeVersion) -}}
{{- print "apiextensions.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "apiextensions.k8s.io/v1" -}}
{{- end -}}
{{- end -}}
