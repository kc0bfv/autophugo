---
{{- $imgglob := printf "*%s" (path.Join .File.Dir "**") -}}
{{- $resources := where (resources.Match $imgglob) "ResourceType" "image" }}
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
{{- if .Site.Params.sort_by_weight }}
weight: 0
{{- end }}
albumthumb: "{{ cond (gt (len $resources) 0) (index $resources 0) "" }}"
draft: false
## Optional additional meta info for resources list
#  alt: Image alternative and screen-reader text
#  phototitle: A title for the photo
#  description: A sub-title or description for the photo
resources:
{{ range $elem_index, $elem_val := $resources -}}
- src: "{{ . }}"
{{- if $.Site.Params.sort_by_weight }}
  weight: {{ add (mul $elem_index 10) 10 }}
{{- end }}
{{ end -}}
---
