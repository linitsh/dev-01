{{/* Docs
name  : _.labels.common
type  : keys
desc  :
- Common labels
use   : [ _.names.chart-name-version , _.labels.selector ]
params: []
values: [ .Chart.AppVersion , .Release.Service ]
examples: 
- simple: |-
    keys: 
      {{- include "_.labels.common" . | nindent 4 }}
  result: |-
    keys:
      helm.sh/chart: gold-0.1.0
      app.kubernetes.io/name: gold
      app.kubernetes.io/instance: test-chart
      app.kubernetes.io/version: "1.16.0"
      app.kubernetes.io/managed-by: Helm
*/}}

{{- define "_.labels.common" -}}
helm.sh/chart: {{ include "_.names.chart-name-version" . }}
{{ include "_.labels.selector" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
