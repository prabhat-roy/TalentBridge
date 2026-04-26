{{- define "total-reward.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "total-reward.labels" -}}
app.kubernetes.io/name: total-reward
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: compensation
{{- end -}}

{{- define "total-reward.selectorLabels" -}}
app.kubernetes.io/name: total-reward
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
