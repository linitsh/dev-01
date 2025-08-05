{{/* =:
- Return a hard nodeAffinity definition.
uselib: []
values: []
params: [ key , values ]
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
