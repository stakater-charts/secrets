{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "storage.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "storage.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "secrets.labels.selector" -}}
app: {{ .Values.labels.app }}
group: {{ .Values.labels.group }}
provider: {{ .Values.labels.provider }}
{{- end -}}

{{- define "secrets.labels.stakater" -}}
{{ template "secrets.labels.selector" . }}
version: "{{ .Values.labels.version }}"
{{- end -}}

{{- define "secrets.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}
