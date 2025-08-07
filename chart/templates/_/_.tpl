{{/* =:
-
uselib: []
values: []
params: []
examples: 
- simple: |-
    key : 
  result: |-
    key : 
*/}}


{{/* =:
-
uselib: [ some , some.two ]
values: [ Char.Name , Release.Name ]

params: [ param1 , param2 ]
params:
- name: param1
  desc: path1
- name: param2
  desc:|-
    path2

examples: 
- simple: |-
    key : {{}}
  result: |-
    key : some
- params: |-
    keys:
      {{}}
  result: |-
    keys:
      some: value
*/}}


{{- define "_.foo.list" -}}{{- $args := . -}}{{- $len := len $args -}}
    {{- $param1 := 5 }}{{- if gt $len 0 }}{{ $param1 = index $args 0 }}{{ end -}}

    {{- print $param1 -}}
{{- end -}}
{{- define "_.foo.dict" -}}
    {{- $param1 := 5 }}{{- if hasKey . "param1" }}{{ $param1 = .param1 }}{{ end -}}

    {{- print $param1 -}}
{{- end -}}
