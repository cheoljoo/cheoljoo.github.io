---
title: "work style"
date: 2019-04-06 08:26:28 -0400
categories: python statistics schedule
---

> [Previous Blog](https://cheoljoo.github.io/jekyll/blog/doxygen/habit/schedule/ps/starting-post/)

# Project of ```work style```
## kinds of works
- google calendar
- python programming from google calendar
- jekyll for website and blog
- d3.js for infographics
- python programming for statistics of my work style
    - format : yaml / json

## How to know it  (google calendar)
- I use google calendar to insert what I do at that time.
- I use google calendar API to get google calendar information.
- I use python to use google calendar API.

## How to insert (python programming from google calendar)
- I have two methods.
    - input the value directly on the website (google calendar)
    - I made the command based on text.   [schedule](https://github.com/cheoljoo/schedule)
        - cd googleCalendar
        - copy heal2u/* .  (for use heal2u account)
        - python3 insert.py
- Basics to use command
    - 2019.01.01 has all kinds of list of my works.
    - this command shows the list to choose it easily

## How to check validation (jekyll for website and blog)
- [jekyll for website and blog](https://jekyllrb.com/docs/step-by-step/01-setup/)

### how to do for jekyll
- gem install jekyll bundler
- jekyll new myblog
- cd myblog
> copy this repository into this
- jekyll build
- jekyll serve
- [Local Host Website](http://localhost:4000)

## How to show it efficiently (d3.js for infographics)
- work result (just bar and pie chart)
    - [bar chart for my monthly work style](https://heal2u.github.io/bar-chart/)
    - [pie chart for my monthly work style](https://heal2u.github.io/pie-chart/)
- reference
    - [heal2u blog](https://github.com/heal2u/heal2u.github.io)
    - [Original Reference](http://apievangelist.com/)

## How to make statistics (python programming for statistics of my work style)
- [Reference with Python Program](https://github.com/cheoljoo/schedule/blob/master/googleCalendar/README.md)
- yaml
    - [bar-chart.yaml](https://github.com/heal2u/heal2u.github.io/blob/master/_data/bar-chart.yaml) is made by python program.
- json
    - [2019-short.json](https://github.com/heal2u/heal2u.github.io/blob/master/data/2019-short.json)

### make statistics each month (normal bar and pie style)
- python3 statistics.py
    - statistics.py -y <year> -m <month>
- ex) python3 statistics.py -y 2019 -m 4
    - deliverables
        - 2019-04-short.yaml
        - 2019-04-long.yaml
- where can you show the result : 
    - [Bar Chart](https://heal2u.github.io/bar-chart/)
    - [Pie Chart](https://heal2u.github.io/pie-chart/)
    - [Json file for Bar Chart](https://heal2u.github.io/data/bar-chart.json)
    - [Json file for Pie Chart](https://heal2u.github.io/data/pie-chart.json)
- d3.js : ./chart source code
    - [data yaml of monthly work style](https://github.com/heal2u/heal2u.github.io/blob/master/_data/bar-chart.yaml)  : take care of file name
    - [data json of yearly work style](https://github.com/heal2u/heal2u.github.io/blob/master/data/bar-chart.json)
    - [source of bar chart monthly work style](https://github.com/heal2u/heal2u.github.io/blob/master/bar-chart/index.html)
    - [source of pie chart monthly work style](https://github.com/heal2u/heal2u.github.io/blob/master/pie-chart/index.html)
    - reference
        - [Bar Chart : D3.js Visualizations Using YAML and Jekyll](https://apievangelist.com/2016/09/20/d3js-visualizations-using-yaml-and-jekyll/)
        - [Pie Chart : D3.js Visualizations Using YAML and Jekyll](http://d3.js.yaml.jekyll.apievangelist.com/pie-chart/)

### make statistics each year (stacked style)
- python3 year_statistics.py
    - year_statistics.py -y <year> -m <month>
- ex) python3 statistics.py -y 2019 -m 4    : get statistics until 2019/04
    - deliverables
        - 2019-short.json
        - 2019-long.json
- where can you show the result : 
    - You can not see the proper result in github. But you can see the result in jekyll developing environment.
        - [localhost website for local jekyll environment](http://localhost:4000/stacked/)
    - ![Stacked_Bar_Chart](https://github.com/cheoljoo/schedule/blob/master/images/2019-04-07_stacked.png)
- d3.js : ./stacked_bar_chart
    - ./stacked_bar_chart/data/2019-short.json
    - ./stacked_bar_chart/stacked/index.html
    - reference
        - [Stacked Bar Chart Original Example](http://bl.ocks.org/jamesleesaunders/ac5b6134ad7144e8327d)
        - [Original Stacked Bar Chart reference](http://bl.ocks.org/mstanaland/6100713)

## How to use statistics for d3.js ( it is not complete. it depends on cases. )
- I should clear the unsolved problem.
    - I can not show the proper stacked bar chart in [heal2u](https://heal2u.github.io) .
    - jekyll local server is ok but heal2u.github.io is fail. When I view the source code of their page, they are same. I do not know what is different.


