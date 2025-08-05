{{/* =:
- Return a soft nodeAffinity definition.
uselib: []
values: []
params: [ key , values ]
examples: 
- simple: |-
    keys: 
      {{- include "_.affinities.nodes.soft" (dict "key" "FOO" "values" (list "BAR" "BAZ")) | nindent 4 }}
  result: |-
    keys:
      preferredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: FOO
                operator: In
                values:
                  - "BAR"
                  - "BAZ"
*/}}

{{- define "_.affinities.nodes.soft" -}}
preferredDuringSchedulingIgnoredDuringExecution:
  - preference:
      matchExpressions:
        - key: {{ .key }}
          operator: In
          values:
            {{- range .values }}
            - {{ . | quote }}
            {{- end }}
    weight: 1
{{- end -}}
