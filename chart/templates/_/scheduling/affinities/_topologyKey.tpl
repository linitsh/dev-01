{{/* Docs
name  : _.affinities.topologyKey
desc  :
- Return a topologyKey definition.
type  : keys
use   : []
params: [ topologyKey ]
values: []
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
