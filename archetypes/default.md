---
{{- $imgglob := printf "*%s" (path.Join .File.Dir "**") -}}
{{- $resources := resources.Match $imgglob }}
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
description: "<p></p>"
authors: [ "Sylvia" ]
albumdate: {{ dateFormat "January 2, 2006" .Date }}
albumthumb: {{ index $resources 0 }}
draft: false
## Optional additional meta info for resources list
#  alt: Same tag
#  phototitle: My title
#  description: My description
resources:
{{ range $elem_index, $elem_val := $resources -}}
- src: {{ . }}
  weight: {{ mul $elem_index 10 }}
{{ end -}}
---
