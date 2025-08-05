{{/*
Return the appropriate apiVersion for Vertical Pod Autoscaler.
*/}}
{{- define "_.capabilities.vpa.apiVersion" -}}
{{- $kubeVersion := include "_.capabilities.kubeVersion" .context -}}
{{- if and (not (empty $kubeVersion)) (semverCompare "<1.11-0" $kubeVersion) -}}
{{- print "autoscaling/v1beta1" -}}
{{- else if and (not (empty $kubeVersion)) (semverCompare "<1.25-0" $kubeVersion) -}}
{{- print "autoscaling/v1beta2" -}}
{{- else -}}
{{- print "autoscaling/v1" -}}
{{- end -}}
{{- end -}}
