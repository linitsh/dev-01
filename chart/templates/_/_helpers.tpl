

{{- define "_.foo.list" -}}{{- $args := . -}}{{- $len := len $args -}}
    {{- $param1 := 5 }}{{- if gt $len 0 }}{{ $param1 = index $args 0 }}{{ end -}}

    {{- print $param1 -}}
{{- end -}}
{{- define "_.foo.dict" -}}
    {{- $param1 := 5 }}{{- if hasKey . "param1" }}{{ $param1 = .param1 }}{{ end -}}

    {{- print $param1 -}}
{{- end -}}
