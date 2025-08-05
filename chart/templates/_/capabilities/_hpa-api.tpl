{{/*
Return the appropriate apiVersion for Horizontal Pod Autoscaler.
*/}}
{{- define "_.capabilities.hpa.apiVersion" -}}
{{- $kubeVersion := include "_.capabilities.kubeVersion" .context -}}
{{- if and (not (empty $kubeVersion)) (semverCompare "<1.23-0" $kubeVersion) -}}
{{- if .beta2 -}}
{{- print "autoscaling/v2beta2" -}}
{{- else -}}
{{- print "autoscaling/v2beta1" -}}
{{- end -}}
{{- else -}}
{{- print "autoscaling/v2" -}}
{{- end -}}
{{- end -}}


