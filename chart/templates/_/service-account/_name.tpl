{{/* Docs
desc  :
- Create the name of the service account to use 
uselib: [ names.fullname ]
values: [ Values.ServiceAccount.create , Values.ServiceAccount.name ]
params: []
examples: 
- simple: |-
    key : {{ include "_.sa.name" . }}
  result: |-
    key : test-chart-gold
*/}}

{{/* Create the name of the service account to use */}}
{{- define "_.sa.name" -}}

    {{- if .Values.ServiceAccount.create }}

        {{- default (include "_.names.fullname" .) .Values.ServiceAccount.name }}

    {{- else }}

        {{- default "default" .Values.ServiceAccount.name }}
        
    {{- end }}

{{- end }}
