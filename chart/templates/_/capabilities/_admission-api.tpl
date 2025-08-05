{{/*
Return the appropriate apiVersion for AdmissionConfiguration.
*/}}
{{- define "_.capabilities.admissionConfiguration.apiVersion" -}}
{{- $kubeVersion := include "_.capabilities.kubeVersion" . -}}
{{- if and (not (empty $kubeVersion)) (semverCompare "<1.23-0" $kubeVersion) -}}
{{- print "apiserver.config.k8s.io/v1alpha1" -}}
{{- else if and (not (empty $kubeVersion)) (semverCompare "<1.25-0" $kubeVersion) -}}
{{- print "apiserver.config.k8s.io/v1beta1" -}}
{{- else -}}
{{- print "apiserver.config.k8s.io/v1" -}}
{{- end -}}
{{- end -}}
