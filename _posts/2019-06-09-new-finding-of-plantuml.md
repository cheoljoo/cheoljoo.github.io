---
title: "New finding of plantuml : How to show plantuml as a png without server""
date: 2019-06-09 08:26:28 -0400
---

New finding of plantuml : How to show plantuml as a png without server

# New methods how to show plantuml 

## policy and steps
- 1. make plantuml file separately
    - make plantuml file (sample.txt)  in github : (row file example)[https://raw.githubusercontent.com/cheoljoo/cheoljoo.github.io/master/sample.txt]
    ```
    @startuml
    Alice -> Bob: Authentication Request
    Bob --> Alice: Authentication Response
    
    Alice -> Bob: Another authentication Request
    Alice <-- Bob: Another authentication Response
    @enduml
    ```

## plantuml for Editor
- 2. insert lines (puml) to show plantuml in ATOM and visual studio code editor as preview
    - use puml !includeurl with raw file location in md file
```puml
!includeurl https://raw.githubusercontent.com/cheoljoo/cheoljoo.github.io/master/sample.txt
```

## plantuml for web
- 3. change it into png or external link using plantuml proxy

### 3.1. png : directly create png file using java plantuml.jar
- make png files in specific directory and change the puml into png link

### 3.2. external link using plantuml proxy  proxy?rawFileLocation
- this is the best method to show it.
	![img](http://www.plantuml.com/plantuml/proxy?src=https://raw.githubusercontent.com/cheoljoo/cheoljoo.github.io/master/sample.txt)

