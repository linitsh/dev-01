---
title     : Project Structure
tags      : []
categories: []
---
---
### Schema
``` shell
devops-repo.git
.
│
├── argocd/
│   ├── main/            # specific appset & project folder
│   │   ├── project.yaml # specific project for this set
│   │   └── set.yaml     # application set for chart and his values 
│   ├── main-root.yaml   # main argocd root application for 'main' folder
│   │
│   ├── [any]/           # optional - can add more set  folders
│   └── [any]-root.yaml  # optional - can add more root applications
│
├── chart/               # optional - can be in other repo (chage in /argocd/main/set.yaml)
│   └── ... 
│
├── docs/
│
├── logs/
│
├── tasks/
│
├── values/                   # helmchart values cocmposition
│   │
│   ├── @envs/                # specific environment values
│   │   ├── name-of-env.yaml  # endless composition of values + extend other levels + config for appset
│   │   └── ...               # more envs
│   │
│   ├── default/              # level 0 values ( core )
│   │   ├── skip.yaml         # empty file (means libs can use Chart.yaml for data) (aka include "_.image")
│   │   ├── default.yaml      # core devault values for all configurations.
│   │   └── ...               # another variant of default values can be defined if need. 
│   │
│   ├── image/                # level 1 add or override ( image versions )
│   │   ├── skip.yaml         # empty file (use data from level above etc)
│   │   ├── dev.yaml          # extended version for dev env
│   │   ├── prod.yaml         # extended version for prod env
│   │   └── ...               # more variants of image information
│   │
│   ├── power/                # level 2 add or override ( resources and loads )
│   │   ├── skip.yaml         # empty file (use data from level above etc)
│   │   ├── max.yaml          # bigger resources and replicas
│   │   ├── max.yaml          # lover  resources and replicas
│   │   └── ...               # more variants of resources
│   │
│   ├── region/               # level 3 add or override ( specific region values )
│   │   ├── skip.yaml         # empty file (use data from level above etc)
│   │   ├── en.yaml           # secific values for EN region
│   │   ├── eu .yaml          # secific values for EU region
│   │   └── ...               # more variants of region
│   │
│   └── [more]                # optional add more extend categories if need - change in /argocd/main/set.yaml
│       └── ... 
│
├── .editorconfig
│
├── .env
│
├── .gitignore
│
├── .gitlab-ci.yml
│
├── aliases.txt
│
├── dot.env
│
├── README.md
│
└── taskfile.yaml
```
