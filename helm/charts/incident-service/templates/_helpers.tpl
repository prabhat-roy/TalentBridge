{{- define "incident-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "incident-service.labels" -}}
app.kubernetes.io/name: incident-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: occupational-health
{{- end -}}

{{- define "incident-service.selectorLabels" -}}
app.kubernetes.io/name: incident-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
