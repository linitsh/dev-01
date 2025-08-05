{{/*
Return the appropriate apiVersion for statefulset.
*/}}
{{- define "_.capabilities.statefulset.apiVersion" -}}
{{- $kubeVersion := include "_.capabilities.kubeVersion" . -}}
{{- if and (not (empty $kubeVersion)) (semverCompare "<1.14-0" $kubeVersion) -}}
{{- print "apps/v1beta1" -}}
{{- else -}}
{{- print "apps/v1" -}}
{{- end -}}
{{- end -}}


