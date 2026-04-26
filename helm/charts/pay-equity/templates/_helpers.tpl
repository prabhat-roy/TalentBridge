{{- define "pay-equity.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "pay-equity.labels" -}}
app.kubernetes.io/name: pay-equity
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: analytics
{{- end -}}

{{- define "pay-equity.selectorLabels" -}}
app.kubernetes.io/name: pay-equity
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
