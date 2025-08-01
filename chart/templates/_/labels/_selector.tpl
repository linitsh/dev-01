{{/* Docs
desciption:
- Generate selector labels for any.
usage: 'matchLabels: > {{- include "_.labels.selector" . \| nindent [n] }}'
type: object-props
use: 
- _.names.name
params: []
values: 
- .Release.Name
examples: 
- simple: |
    selector:
      matchLabels:
        {{- include "_.labels.selector" . | nindent 6 }}
*/}}

{{- define "_.labels.selector" -}}
app.kubernetes.io/name: {{ include  "_.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
