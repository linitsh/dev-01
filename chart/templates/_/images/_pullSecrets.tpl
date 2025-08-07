{{/* =:
- Return the proper Docker Image Registry Secret Names (deprecated: use _.images.renderPullSecrets instead)
uselib: []
values: []
params: 
- name: images
  desc: List to values images root paths
examples: 
- simple: |-
    keys: 
      {{- include "_.images.pullSecrets" ( dict "images" (list .Values.path.to.the.image1, .Values.path.to.the.image2) "global" .Values.global) }}
  result: |-
    keys: 
      key: unknown
*/}}

{{- define "_.images.pullSecrets" -}}

  {{- $pullSecrets := list }}

  {{- range ((.global).imagePullSecrets) -}}
    {{- if kindIs "map" . -}}
      {{- $pullSecrets = append $pullSecrets .name -}}
    {{- else -}}
      {{- $pullSecrets = append $pullSecrets . -}}
    {{- end }}
  {{- end -}}

  {{- range .images -}}
    {{- range .pullSecrets -}}
      {{- if kindIs "map" . -}}
        {{- $pullSecrets = append $pullSecrets .name -}}
      {{- else -}}
        {{- $pullSecrets = append $pullSecrets . -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

    {{- if (not (empty $pullSecrets)) -}}
imagePullSecrets:
        {{- range $pullSecrets | uniq }}
  - name: {{ . }}
        {{- end }}
    {{- end }}
{{- end -}}
