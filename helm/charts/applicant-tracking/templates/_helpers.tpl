{{- define "applicant-tracking.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "applicant-tracking.labels" -}}
app.kubernetes.io/name: applicant-tracking
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: recruitment
{{- end -}}

{{- define "applicant-tracking.selectorLabels" -}}
app.kubernetes.io/name: applicant-tracking
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
