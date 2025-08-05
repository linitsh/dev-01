{{/* Docs
desc  :
- Return the proper image version (ingores image revision/prerelease info & fallbacks to chart appVersion)
uselib: []
values: []
params: [ imageRoot , chart ]
examples: 
- simple: |-
    key : {{ include "_.images.version" ( dict "imageRoot" .Values.Deployment.Image "chart" .Chart ) }}
  result: |-
    key : 1.16.0
*/}}

{{- define "_.images.version" -}}
{{- $imageTag := .imageRoot.tag | toString -}}
{{/* regexp from https://github.com/Masterminds/semver/blob/23f51de38a0866c5ef0bfc42b3f735c73107b700/version.go#L41-L44 */}}
{{- if regexMatch `^([0-9]+)(\.[0-9]+)?(\.[0-9]+)?(-([0-9A-Za-z\-]+(\.[0-9A-Za-z\-]+)*))?(\+([0-9A-Za-z\-]+(\.[0-9A-Za-z\-]+)*))?$` $imageTag -}}
    {{- $version := semver $imageTag -}}
    {{- printf "%d.%d.%d" $version.Major $version.Minor $version.Patch -}}
{{- else -}}
    {{- print .chart.AppVersion -}}
{{- end -}}
{{- end -}}

