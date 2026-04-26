{{- define "diversity-analytics.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "diversity-analytics.labels" -}}
app.kubernetes.io/name: diversity-analytics
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: analytics
{{- end -}}

{{- define "diversity-analytics.selectorLabels" -}}
app.kubernetes.io/name: diversity-analytics
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
