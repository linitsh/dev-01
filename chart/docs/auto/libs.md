---
title     : Libs
tags      : []
categories: []
---
---
### Libs  

[labels](#labels)  
- [labels.common](#labels-common)  

- [labels.selector](#labels-selector)  


___
___
### labels <a name="labels">⚓</a>

___
#### labels.common <a name="labels-common">⚓</a>

| path   |                       `labels/_common.tpl`                       |
| :----- | :--------------------------------------------------------------: |
| type   |                          `object-props`                          |
| usage  |   `labels: > {{- include "_.labels.common" . \| nindent [n] }}`  |
| use    |        [ `_.names.chartNameVersion`, `_.labels.selector` ]       |
| values | [ `.Chart.AppVersion`, `.Chart.AppVersion`, `.Release.Service` ] |

#### Description:  
Generate common labels for any.  


#### Examples:  

- **simple:**

```yaml
metadata:
  labels:
    {{- include "_.labels.common" . | nindent 8 }}
```
  

___
#### labels.selector <a name="labels-selector">⚓</a>

| path   |                        `labels/_selector.tpl`                        |
| :----- | :------------------------------------------------------------------: |
| type   |                            `object-props`                            |
| usage  | `matchLabels: > {{- include "_.labels.selector" . \| nindent [n] }}` |
| use    |                          [ `_.names.name` ]                          |
| values |                          [ `.Release.Name` ]                         |

#### Description:  
Generate selector labels for any.  


#### Examples:  

- **simple:**

```yaml
selector:
  matchLabels:
    {{- include "_.labels.selector" . | nindent 6 }}
```
  
