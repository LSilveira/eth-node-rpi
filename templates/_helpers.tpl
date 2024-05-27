{{/*
Expand the name of the chart.
*/}}
{{- define "eth-node-rpi.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "eth-node-rpi.fullname" -}}
{{- if .Values.fullnameOverride }}
    {{- if .Values.env }}
    {{- printf "%s-%s" .Values.fullnameOverride .Values.env }}
    {{- else }}
    {{- printf "%s" .Values.fullnameOverride }}
    {{- end }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "eth-node-rpi.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "eth-node-rpi.labels" -}}
helm.sh/chart: {{ include "eth-node-rpi.chart" . }}
{{ include "eth-node-rpi.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "eth-node-rpi.selectorLabels" -}}
app.kubernetes.io/name: {{ include "eth-node-rpi.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "eth-node-rpi.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "eth-node-rpi.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
