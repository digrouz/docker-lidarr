{{/*
Expand the name of the chart.
*/}}
{{- define "lidarr.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- .Release.Name }}-lidarr
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "lidarr.labels" -}}
app.kubernetes.io/name: lidarr
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end }}

{{/*
PVC claim name helpers
*/}}
{{- define "lidarr.pvc.config" -}}
{{- if .Values.persistence.config.pvc.existingClaim }}
{{- .Values.persistence.config.pvc.existingClaim }}
{{- else }}
{{- .Release.Name }}-config-pvc
{{- end }}
{{- end }}

{{- define "lidarr.pvc.downloads" -}}
{{- if .Values.persistence.downloads.pvc.existingClaim }}
{{- .Values.persistence.downloads.pvc.existingClaim }}
{{- else }}
{{- .Release.Name }}-downloads-pvc
{{- end }}
{{- end }}

{{- define "lidarr.pvc.music" -}}
{{- if .Values.persistence.music.pvc.existingClaim }}
{{- .Values.persistence.music.pvc.existingClaim }}
{{- else }}
{{- .Release.Name }}-music-pvc
{{- end }}
{{- end }}
