
{{- if .Values.test }}

apiVersion: v1
kind: Pod
metadata:
  name: "{{ include "names.fullname" . }}-test-connection"
  labels:
    {{- include "labels.commonLabels" . | nindent 4 }}
  annotations:
    "helm.sh/hook": test
spec:
  restartPolicy: Never
  containers:
    - name   : wget
      image  : busybox
      command: ['wget']
      args   : ['{{ include "names.fullname" . }}:{{ .Values.service.port }}']

{{- end  }}