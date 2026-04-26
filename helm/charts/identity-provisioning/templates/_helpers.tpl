{{- define "identity-provisioning.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "identity-provisioning.labels" -}}
app.kubernetes.io/name: identity-provisioning
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: integrations
{{- end -}}

{{- define "identity-provisioning.selectorLabels" -}}
app.kubernetes.io/name: identity-provisioning
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
