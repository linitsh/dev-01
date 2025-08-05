{{/* =:
- Return a nodeAffinity definition.
uselib: [ affinities.nodes.soft , affinities.nodes.hard ]
values: []
params:
- name: type
  desc: reuse "soft" or "hard" affinities.
examples: 
- simple: |-
    keys: 
      {{- include "_.affinities.nodes" (dict "type" "soft" "key" "FOO" "values" (list "BAR" "BAZ")) | nindent 4 }}
  result: |-
    keys:
      soft-nodes-affinities : result
*/}}

{{- define "_.affinities.nodes" -}}

  {{- if eq .type "soft" }}

    {{- include "_.affinities.nodes.soft" . -}}

  {{- else if eq .type "hard" }}

    {{- include "_.affinities.nodes.hard" . -}}

  {{- end -}}

{{- end -}}
