{{/* =:
- Kubernetes standard labels.
uselib: [ names , tplvalues ]
values: [ Release.Name , Chart.AppVersion  , Release.Name , Release.Service ]
params:
- name: customLabels
  desc: Labels path aka - Values.Common.labels
- name: context 
examples: 
- simple: |-
    keys: 
      {{- include "_.labels.standard" . | nindent 4 }}
  result: |-
    keys:
      app.kubernetes.io/name: chart
      helm.sh/chart: chart-0.1.0
      app.kubernetes.io/instance: test-chart
      app.kubernetes.io/managed-by: Helm
      app.kubernetes.io/version: "1.16.0"
*/}}

{{- define "_.labels.standard" -}}

  {{- if and (hasKey . "customLabels") (hasKey . "context") -}}
    
      {{- $default := dict "app.kubernetes.io/name" (include "_.names.name" .context) "helm.sh/chart" (include "_.names.chart-name-version" .context) "app.kubernetes.io/instance" .context.Release.Name "app.kubernetes.io/managed-by" .context.Release.Service -}}
      
      {{- with .context.Chart.AppVersion -}}
          {{- $_ := set $default "app.kubernetes.io/version" . -}}
      {{- end -}}
      
      {{ template "_.tplvalues.merge" (dict "values" (list .customLabels $default) "context" .context) }}

  {{- else -}}
helm.sh/chart               : {{ include "_.names.chart-name-version" . }}
app.kubernetes.io/name      : {{ include "_.names.name" . }}
app.kubernetes.io/instance  : {{ .Release.Name }}
    {{- with .Chart.AppVersion }}
app.kubernetes.io/version   : {{ . | quote }}
    {{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
  {{- end -}}
{{- end -}}
