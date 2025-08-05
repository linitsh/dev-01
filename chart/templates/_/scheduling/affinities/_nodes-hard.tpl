{{/* Docs
name  : _.affinities.nodes.hard
desc  :
- Return a hard nodeAffinity definition.
type  : keys
use   : []
params: [ key , values ]
values: []
examples: 
- simple: |-
    keys: 
      {{- include "_.affinities.nodes.hard" (dict "key" "FOO" "values" (list "BAR" "BAZ")) | nindent 4 }}
  result: |-
    keys:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: FOO
                operator: In
                values:
                  - "BAR"
                  - "BAZ"
*/}}

{{- define "_.affinities.nodes.hard" -}}
requiredDuringSchedulingIgnoredDuringExecution:
  nodeSelectorTerms:
    - matchExpressions:
        - key: {{ .key }}
          operator: In
          values:
            {{- range .values }}
            - {{ . | quote }}
            {{- end }}
{{- end -}}
