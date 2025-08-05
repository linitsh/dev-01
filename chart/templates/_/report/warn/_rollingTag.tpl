
{{/*
Warning about using rolling tag.
Usage:
{{ include "_.warnings.rollingTag" .Values.path.to.the.imageRoot }}
*/}}
{{- define "_.warnings.rollingTag" -}}

{{- if and (contains "bitnami/" .repository) (not (.tag | toString | regexFind "-r\\d+$|sha256:")) }}
WARNING: Rolling tag detected ({{ .repository }}:{{ .tag }}), please note that it is strongly recommended to avoid using rolling tags in a production environment.
+info https://techdocs.broadcom.com/us/en/vmware-tanzu/application-catalog/tanzu-application-catalog/services/tac-doc/apps-tutorials-understand-rolling-tags-containers-index.html
{{- end }}
{{- end -}}
