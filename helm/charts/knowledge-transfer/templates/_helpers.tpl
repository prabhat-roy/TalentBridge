{{- define "knowledge-transfer.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "knowledge-transfer.labels" -}}
app.kubernetes.io/name: knowledge-transfer
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: offboarding
{{- end -}}

{{- define "knowledge-transfer.selectorLabels" -}}
app.kubernetes.io/name: knowledge-transfer
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
