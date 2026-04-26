{{- define "org-design.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "org-design.labels" -}}
app.kubernetes.io/name: org-design
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: workforce-planning
{{- end -}}

{{- define "org-design.selectorLabels" -}}
app.kubernetes.io/name: org-design
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
