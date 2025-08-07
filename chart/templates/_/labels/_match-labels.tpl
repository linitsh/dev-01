{{/* =:
- Labels used on immutable fields such as deploy.spec.selector.match-labels or svc.spec.selector
- We don't want to loop over custom labels appending them to the selector
- since it's very likely that it will break deployments, services, etc.
- However, it's important to overwrite the standard labels if the user
- overwrote them on metadata.labels fields.
uselib: [ tplvalues.render , names.name ]
values: [ Release.Name ]
params: 
- name: customLabels
  desc: Labels path aka - Values.Deployment.Pod.labels
- name: context 
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
      {{- include "_.labels.match-labels" (dict "customLabels" .Pod.labels "context" $) | nindent 6 }}

*/}}

{{- define "_.labels.match-labels" -}}
    {{- if and (hasKey . "customLabels") (hasKey . "context") -}}

        {{- $dict1     := (dict "value" .customLabels "context" .context) -}}
        {{- $pickFrom  := include "_.tplvalues.render" $dict1 | fromYaml  -}}
        {{- $pickWhat1 := "app.kubernetes.io/instance"                    -}}
        {{- $pickWhat2 := "app.kubernetes.io/name"                        -}}
        {{- $pick      := pick ($pickFrom) $pickWhat1 $pickWhat2          -}}
        
        {{- $getName   := include "_.names.name" .context                 -}}
        {{- $dict2     := dict 
            "app.kubernetes.io/name"      $getName 
            "app.kubernetes.io/instance" .context.Release.Name
        -}}

        {{- merge $pick $dict2  | toYaml -}}

    {{- else -}}
app.kubernetes.io/name     : {{ include "_.names.name" . }}
app.kubernetes.io/instance : {{ .Release.Name }}
    {{- end -}}
{{- end -}}
