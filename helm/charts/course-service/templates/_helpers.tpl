{{- define "course-service.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "course-service.labels" -}}
app.kubernetes.io/name: course-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: learning
{{- end -}}

{{- define "course-service.selectorLabels" -}}
app.kubernetes.io/name: course-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
