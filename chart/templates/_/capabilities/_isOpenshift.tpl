{{/* 
Return true if the detected platform is Openshift
Usage:
{{- include "_.compatibility.isOpenshift" . -}}
*/}}
{{- define "_.compatibility.isOpenshift" -}}
{{- if .Capabilities.APIVersions.Has "security.openshift.io/v1" -}}
{{- true -}}
{{- end -}}
{{- end -}}
