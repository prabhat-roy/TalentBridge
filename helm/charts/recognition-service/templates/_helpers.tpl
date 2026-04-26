{{- define "recognition-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "recognition-service.labels" -}}
app.kubernetes.io/name: recognition-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: experience
{{- end -}}

{{- define "recognition-service.selectorLabels" -}}
app.kubernetes.io/name: recognition-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
