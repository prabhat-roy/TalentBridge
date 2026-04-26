{{- define "ethics-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ethics-service.labels" -}}
app.kubernetes.io/name: ethics-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: compliance
{{- end -}}

{{- define "ethics-service.selectorLabels" -}}
app.kubernetes.io/name: ethics-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
