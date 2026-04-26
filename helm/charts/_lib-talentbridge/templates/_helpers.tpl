{{- define "talentbridge.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "talentbridge.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "talentbridge.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- include "talentbridge.fullname" . -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{- define "talentbridge.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "talentbridge.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: talentbridge
talentbridge.io/domain: {{ .Values.domain | default "core" }}
talentbridge.io/region: {{ .Values.region | default "unset" }}
talentbridge.io/data-residency: {{ .Values.dataResidencyClass | default "regional" }}
{{- end -}}

{{- define "talentbridge.selectorLabels" -}}
app.kubernetes.io/name: {{ include "talentbridge.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
