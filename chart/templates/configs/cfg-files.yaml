kind: ConfigMap
apiVersion: v1
metadata:
  name: {{ include "names.fullname" . }}
  namespace: default
data:
{{- range $name, $value := .Values.cfmFiles }}
  {{ $name }}: {{ print "|" }}
    {{- $value | nindent 4 }}
{{- end }}