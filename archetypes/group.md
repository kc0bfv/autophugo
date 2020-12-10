---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
description: "<p></p>"
albumdate: {{ dateFormat "January 2, 2006" .Date }}
albumthumb: ""
type: "group"
draft: false
---

