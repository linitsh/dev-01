{{/* Docs
desc  :
- Return a topologyKey definition.
uselib: []
values: []
params: [ topologyKey ]
examples: 
- simple: |-
    keys:
      {{ include "_.affinities.topologyKey" (dict "topologyKey" "BAR") -}} : value
  result: |-
    keys:
      BAR: value
*/}}

{{- define "_.affinities.topologyKey" -}}

    {{ .topologyKey | default "kubernetes.io/hostname" -}}

{{- end -}}
