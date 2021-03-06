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

```text
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
- this is source of link and input file
    - source of link & input file
```
![img](http://www.plantuml.com/plantuml/proxy?src=https://raw.githubusercontent.com/cheoljoo/cheoljoo.github.io/master/sample.txt)
```

```puml
@startuml
Alice -> Bob: Authentication Request
Bob --> Alice: Authentication Response

Alice -> Bob: Another authentication Request
Alice <-- Bob: Another authentication Response
@enduml
```

### use the link from plantuml server
- use : https://plantuml-server.kkeisuke.app


# Lable on relations of class
- I will describe the basic usages.
    - Class : name starts with C
    - Interface : name starts with I

## Map between C++ and plantuml
- normal class with derived class
    - ![img](http://www.plantuml.com/plantuml/proxy?src=https://raw.githubusercontent.com/cheoljoo/cheoljoo.github.io/master/samples/normal.plantuml)
```cpp
class A : B {};
```

```puml
@startuml
class A 
class B
A --> B
@enduml
```



- inner class
    - ![img](http://www.plantuml.com/plantuml/proxy?src=https://raw.githubusercontent.com/cheoljoo/cheoljoo.github.io/master/samples/inner.plantuml)
    - ![img](https://plantuml-server.kkeisuke.app/png/SoWkIImgAStDuKhEIImkLd1sr7DsHcAxS3axAkZgsYauEt61vI0Si8n3QbuAK2S0.png)
```cpp 
class  CA : CB {
    class CC : CD {
    }
}
```

```puml
@startuml
class CA.CC
class CA.CD
CA --> CB
CA.CC --> CA.CD
@enduml
```


- class with members (member variables) : composition
    - ![img](http://www.plantuml.com/plantuml/proxy?src=https://raw.githubusercontent.com/cheoljoo/cheoljoo.github.io/master/samples/composition.plantuml)
```cpp
class CA : CB {
    CC mC;
}
```

```puml
@startuml
CA --> CB
CA *-- CC : composition
@enduml
```


- pointer or reference : aggregation
    - ![img](http://www.plantuml.com/plantuml/proxy?src=https://raw.githubusercontent.com/cheoljoo/cheoljoo.github.io/master/samples/aggregation.plantuml)
```cpp
class CA : CB {
    CC& mC;
    CD* mD;
}
```

```puml
@startuml
CA --> CB 
CA o-- CC : aggregation
CA o-- CD : aggregation
@enduml
```



- Interface
    - ![img](http://www.plantuml.com/plantuml/proxy?src=https://raw.githubusercontent.com/cheoljoo/cheoljoo.github.io/master/samples/interface.plantuml)
```cpp
class CA : IB {
    CC& mC;
    ID* mD;
}
```

```puml
@startuml
CA ..> IB 
CA o-- CC : interface aggregation
CA o.. ID : interface aggregation
@enduml
```



## relations between modules
- API calls
    - ![img](http://www.plantuml.com/plantuml/proxy?src=https://raw.githubusercontent.com/cheoljoo/cheoljoo.github.io/master/samples/modules.plantuml)

```puml
@startuml
skinparam rectangle {
    roundCorner<<Concept>> 25
}

rectangle "Application" <<Concept>> as Application1 {
    rectangle "Application"
}
rectangle "MiddleWare" <<Concept>> as ServiceManager1 {
    rectangle "ServiceManager"
}
rectangle "OS" <<Concept>> as OS {
    rectangle "Binder"
    rectangle "Linux"
}
Application -(0- ServiceManager
Application -(0- OS
ServiceManager -(0- OS
@enduml
```




## list of used class
- ![img](http://www.plantuml.com/plantuml/proxy?src=https://raw.githubusercontent.com/cheoljoo/cheoljoo.github.io/master/samples/classlist.plantuml)

```puml
@startuml
skinparam componentStyle uml2

package "Package_A" {
[First Component]
[Second Component]
}
[Third Component]

@enduml
```


