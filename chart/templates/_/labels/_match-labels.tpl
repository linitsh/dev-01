{{/* Docs
name  : _.labels.match-labels
type  : keys
desc  :
- Labels used on immutable fields such as deploy.spec.selector.match-labels or svc.spec.selector
- We don't want to loop over custom labels appending them to the selector
- since it's very likely that it will break deployments, services, etc.
- However, it's important to overwrite the standard labels if the user
- overwrote them on metadata.labels fields.
use   : [ _.tplvalues.render , _.names.name ]
params: 
- name: customLabels
  desc: example - .Values.Deployment.Pod.labels
- name: context 
values: [ .Release.Name ]
examples: 
- simple: |-
    keys:
      {{- include "_.labels.match-labels" . | nindent 4 }}
  result: |-
    keys:
      app.kubernetes.io/name: chart
      app.kubernetes.io/instance: test-chart
- params: |-
    keys:
      {{ include "_.labels.match-labels" (dict "customLabels" .Values.Deployment.Pod.labels "context" $) -}}

*/}}

{{- define "_.labels.match-labels" -}}

{{- if and (hasKey . "customLabels") (hasKey . "context") -}}
    {{ merge (pick (include "_.tplvalues.render" (dict "value" .customLabels "context" .context) | fromYaml) "app.kubernetes.io/name" "app.kubernetes.io/instance") (dict "app.kubernetes.io/name" (include "_.names.name" .context) "app.kubernetes.io/instance" .context.Release.Name ) | toYaml }}
{{- else -}}
app.kubernetes.io/name: {{ include "_.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- end -}}
