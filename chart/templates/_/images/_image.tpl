{{/* =:
- Return the proper image name.
- If image tag and digest are not defined, termination fallbacks to chart appVersion.
uselib: []
values: []
params: [ imageRoot , global , chart ]
examples: 
- simple: |-
    key : {{ include "_.images.image" ( dict "imageRoot" .Values.Deployment.Image "global" .Values.global "chart" .Chart ) }}
  result: |-
    key : nginx:1.16.0
*/}}

{{- define "_.images.image" -}}

    {{- $registryName := default .imageRoot.registry ((.global).imageRegistry) -}}
    {{- $repositoryName := .imageRoot.repository -}}
    {{- $separator := ":" -}}
    {{- $termination := .imageRoot.tag | toString -}}

    {{- if not .imageRoot.tag }}
        {{- if .chart }}
            {{- $termination = .chart.AppVersion | toString -}}
        {{- end -}}
    {{- end -}}

    {{- if .imageRoot.digest }}
        {{- $separator = "@" -}}
        {{- $termination = .imageRoot.digest | toString -}}
    {{- end -}}

    {{- if $registryName }}
        {{- printf "%s/%s%s%s" $registryName $repositoryName $separator $termination -}}
    {{- else -}}
        {{- printf "%s%s%s"  $repositoryName $separator $termination -}}
    {{- end -}}

{{- end -}}
