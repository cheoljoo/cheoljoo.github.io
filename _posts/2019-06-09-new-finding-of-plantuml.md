---
title: "New finding of plantuml : How to show plantuml as a png without server"
date: 2019-06-09 08:26:28 -0400
categories: plantuml
---

New finding of plantuml : How to show plantuml as a png without server

# New methods how to show plantuml 

## policy and steps
- make plantuml file separately
    - make plantuml file (sample.txt)  in github : [raw file example](https://raw.githubusercontent.com/cheoljoo/cheoljoo.github.io/master/sample.txt)
```
    @startuml
    Alice -> Bob: Authentication Request
    Bob --> Alice: Authentication Response
    
    Alice -> Bob: Another authentication Request
    Alice <-- Bob: Another authentication Response
    @enduml
```

## plantuml for Editor
- insert lines (puml) to show plantuml in ATOM and visual studio code editor as preview
    - use puml !includeurl with raw file location in md file
```puml
!includeurl https://raw.githubusercontent.com/cheoljoo/cheoljoo.github.io/master/sample.txt
```

## plantuml for web
- change it into png or external link using plantuml proxy

### png : directly create png file using java plantuml.jar
- make png files in specific directory and change the puml into png link

### external link using plantuml proxy  proxy?rawFileLocation
- this is the best method to show it. it can reduce the waste storage because puml will be proessed (emulated)  through plantuml proxy server.
	- ![img](http://www.plantuml.com/plantuml/proxy?src=https://raw.githubusercontent.com/cheoljoo/cheoljoo.github.io/master/sample.txt)

