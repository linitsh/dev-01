{{/* Docs
name  : _.labels.selector
type  : keys
desc  :
- Generate selector labels for any.
use   : [ _.names.name ]
params: []
values: [ .Release.Name ]
examples: 
- simple: |-
    keys:
      {{- include "_.labels.selector" . | nindent 6 }}
  result: |-
    keys:
      app.kubernetes.io/name: gold
      app.kubernetes.io/instance: test-chart
*/}}

{{- define "_.labels.selector" -}}
app.kubernetes.io/name: {{ include  "_.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
