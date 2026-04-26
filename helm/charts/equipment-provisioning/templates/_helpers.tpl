{{- define "equipment-provisioning.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "equipment-provisioning.labels" -}}
app.kubernetes.io/name: equipment-provisioning
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: onboarding
{{- end -}}

{{- define "equipment-provisioning.selectorLabels" -}}
app.kubernetes.io/name: equipment-provisioning
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
