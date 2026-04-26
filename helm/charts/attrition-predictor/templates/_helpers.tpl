{{- define "attrition-predictor.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "attrition-predictor.labels" -}}
app.kubernetes.io/name: attrition-predictor
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: analytics
{{- end -}}

{{- define "attrition-predictor.selectorLabels" -}}
app.kubernetes.io/name: attrition-predictor
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
