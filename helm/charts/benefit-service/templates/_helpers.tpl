{{- define "benefit-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "benefit-service.labels" -}}
app.kubernetes.io/name: benefit-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: compensation
{{- end -}}

{{- define "benefit-service.selectorLabels" -}}
app.kubernetes.io/name: benefit-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
