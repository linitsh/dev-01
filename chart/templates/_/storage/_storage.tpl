{{/* Docs
desc  :
- Return the proper Storage Class.
uselib: []
values: [ (global).storageClass , (global).defaultStorageClass , persistence.storageClass ]
params:
- name: persistence
  desc: storageClass path ? 
- name: global
  desc: what global to use ?
examples: 
- simple: |-
    key : {{ include "_.storage.class" ( dict "persistence" .Values.path.to.the.persistence "global" $) }}
  result: |-
    key : 
*/}}

{{- define "_.storage.class" -}}

    {{- $storageClass := (.global).storageClass | default .persistence.storageClass | default (.global).defaultStorageClass | default "" -}}
    
    {{- if $storageClass -}}

        {{- if (eq "-" $storageClass) -}}

            {{- printf "storageClassName: \"\"" -}}

        {{- else -}}

            {{- printf "storageClassName: %s" $storageClass -}}
            
        {{- end -}}

    {{- end -}}

{{- end -}}
