{{- define "talentbridge.deployment" -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "talentbridge.fullname" . }}
  labels: {{- include "talentbridge.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels: {{- include "talentbridge.selectorLabels" . | nindent 6 }}
  template:
    metadata:
      labels:
        {{- include "talentbridge.selectorLabels" . | nindent 8 }}
        {{- with .Values.podLabels }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
      annotations:
        {{- with .Values.podAnnotations }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
    spec:
      serviceAccountName: {{ include "talentbridge.serviceAccountName" . }}
      securityContext: {{- toYaml .Values.securityContext | nindent 8 }}
      containers:
        - name: {{ .Chart.Name }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
            - name: http
              containerPort: {{ .Values.service.targetPort }}
              protocol: TCP
          env:
            - name: PORT
              value: "{{ .Values.service.targetPort }}"
            - name: TALENTBRIDGE_REGION
              value: "{{ .Values.region }}"
            - name: TALENTBRIDGE_DOMAIN
              value: "{{ .Values.domain }}"
            {{- range $k, $v := .Values.config }}
            - name: {{ $k }}
              value: "{{ $v }}"
            {{- end }}
            {{- with .Values.env }}
            {{- toYaml . | nindent 12 }}
            {{- end }}
          {{- with .Values.envFrom }}
          envFrom:
            {{- toYaml . | nindent 12 }}
          {{- end }}
          livenessProbe: {{- toYaml .Values.probes.liveness | nindent 12 }}
          readinessProbe: {{- toYaml .Values.probes.readiness | nindent 12 }}
          resources: {{- toYaml .Values.resources | nindent 12 }}
          securityContext: {{- toYaml .Values.containerSecurityContext | nindent 12 }}
{{- end -}}

{{- define "talentbridge.service" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "talentbridge.fullname" . }}
  labels: {{- include "talentbridge.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector: {{- include "talentbridge.selectorLabels" . | nindent 4 }}
{{- end -}}

{{- define "talentbridge.serviceaccount" -}}
{{- if .Values.serviceAccount.create -}}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ include "talentbridge.serviceAccountName" . }}
  labels: {{- include "talentbridge.labels" . | nindent 4 }}
  {{- with .Values.serviceAccount.annotations }}
  annotations: {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end -}}
{{- end -}}
