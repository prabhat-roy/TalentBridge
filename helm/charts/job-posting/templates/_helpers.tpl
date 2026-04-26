{{- define "job-posting.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "job-posting.labels" -}}
app.kubernetes.io/name: job-posting
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: recruitment
{{- end -}}

{{- define "job-posting.selectorLabels" -}}
app.kubernetes.io/name: job-posting
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
