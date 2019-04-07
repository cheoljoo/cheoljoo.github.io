---
title: "work style"
date: 2019-04-06 08:26:28 -0400
categories: python statistics schedule
---

# My interests
## Schedule programming for statistics of my work
- insert my works on google calendar
- get the information from google calendar through python programming
- todo
    - Need the skill how to insert the result of python into this blog

## Doxygen
- Analyze the doxygen to get 2 things
    - generate markdown
    - generate plantuml for FLOW  (FLOWKEYWORD in xml)

## Problem Solving with my colleages 
- every week we solve one problem.

# IMO
- Be a Habit
    - I wanna get the working sequence.
        - check calendar : before starting work , I check the calendar. Then I set the alarm in my phone in order not to be late for the meeting.
        - check email briefly : see the email briefly and set a flag for seeing later in detail. and set the calendar for meetings.
        - check my working list : write down working something in wiki page. I summarize my weekly report with it.   basically I use this page as weekly report.
        - check email with a flag in detail : write down working something in wiki page. write down what to do and what will to do with the reason and results.
        - post something if I feel....

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
- https://jekyllrb.com/docs/step-by-step/01-setup/

### how to do for jekyll
- gem install jekyll bundler
- jekyll new myblog
- cd myblog
> copy this repository into this
- jekyll build
- jekyll serve
- http://localhost:4000

## How to show it efficiently (d3.js for infographics)
- work result (just bar and pie chart)
    - https://heal2u.github.io/bar-chart/
    - https://heal2u.github.io/pie-chart/
- reference
    - https://github.com/heal2u/heal2u.github.io
    - http://apievangelist.com/

## How to make statistics (python programming for statistics of my work style)
- [Reference with Python Program](https://github.com/cheoljoo/schedule/blob/master/googleCalendar/README.md)
- yaml
    - [bar-chart.yaml](https://github.com/heal2u/heal2u.github.io/blob/master/_data/bar-chart.yaml] is made by python program)
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
    - https://heal2u.github.io/bar-chart/
    - https://heal2u.github.io/pie-chart/
    - https://heal2u.github.io/data/bar-chart.json
    - https://heal2u.github.io/data/pie-chart.json
- d3.js : ./chart
    - https://github.com/heal2u/heal2u.github.io/blob/master/_data/bar-chart.yaml  : take care of file name
    - https://github.com/heal2u/heal2u.github.io/blob/master/data/bar-chart.json
    - https://github.com/heal2u/heal2u.github.io/blob/master/bar-chart/index.html
    - https://github.com/heal2u/heal2u.github.io/blob/master/pie-chart/index.html
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
        - http://localhost:4000/stacked/
    - ![Stacked_Bar_Chart](https://github.com/cheoljoo/schedule/blob/master/images/2019-04-07_stacked.png)
- d3.js : ./stacked_bar_chart
    - ./stacked_bar_chart/data/2019-short.json
    - ./stacked_bar_chart/stacked/index.html
    - reference
        - [Stacked Bar Chart Original Example](http://bl.ocks.org/jamesleesaunders/ac5b6134ad7144e8327d)
        - http://bl.ocks.org/mstanaland/6100713

## How to use statistics for d3.js ( it is not complete. it depends on cases. )
- I should clear the unsolved problem.
    - I can not show the proper stacked bar chart in https://heal2u.github.io


