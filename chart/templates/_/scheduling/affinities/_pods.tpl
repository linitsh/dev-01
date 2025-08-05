{{/* Docs
desc  :
- Return a podAffinity/podAntiAffinity definition.
uselib: [ affinities.pods.soft , affinities.pods.hard ]
values: []
params:
- name: type
  desc: reuse "soft" or "hard" pod affinities.
examples: 
- simple: |-
    keys: 
      {{- include "_.affinities.pods" (dict "type" "soft" "key" "FOO" "values" (list "BAR" "BAZ")) | nindent 4 }}
  result: |-
    keys:
      soft-pod-affinities : result
*/}}

{{- define "_.affinities.pods" -}}

    {{- if eq .type "soft" }}

        {{- include "_.affinities.pods.soft" . -}}

    {{- else if eq .type "hard" }}

        {{- include "_.affinities.pods.hard" . -}}

    {{- end -}}

{{- end -}}
