{{- define "people-analytics.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "people-analytics.labels" -}}
app.kubernetes.io/name: people-analytics
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: analytics
{{- end -}}

{{- define "people-analytics.selectorLabels" -}}
app.kubernetes.io/name: people-analytics
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
