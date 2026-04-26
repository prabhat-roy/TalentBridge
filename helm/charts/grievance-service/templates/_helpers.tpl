{{- define "grievance-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "grievance-service.labels" -}}
app.kubernetes.io/name: grievance-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: compliance
{{- end -}}

{{- define "grievance-service.selectorLabels" -}}
app.kubernetes.io/name: grievance-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
