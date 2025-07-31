---
title     : Lib
tags      : []
categories: []
---
---
### Lib

#### _.snip

file: `chart/templates/_/_snip.tpl`
---
includes:
- `names`
---
type: `value`
---
values:
- `.Values.names.override.name`
---
desciption:  
Create some name  
and here link [git](https://google.com)  
---
usage:  
```yaml
key: {{ include "names.name" . }}
```
---
examples:  
- simple:
```yaml
metadata:
    name: {{ include "names.name" . }}
```
---


