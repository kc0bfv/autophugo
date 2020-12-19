---
{{- $imgglob := printf "*%s" (path.Join .File.Dir "**") -}}
{{- $resources := where (resources.Match $imgglob) "ResourceType" "image" }}
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
albumthumb: "{{ cond (gt (len $resources) 0) (index $resources 0) "" }}"
type: "group"
draft: false
---

