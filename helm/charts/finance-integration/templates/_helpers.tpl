{{- define "finance-integration.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "finance-integration.labels" -}}
app.kubernetes.io/name: finance-integration
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: integrations
{{- end -}}

{{- define "finance-integration.selectorLabels" -}}
app.kubernetes.io/name: finance-integration
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
