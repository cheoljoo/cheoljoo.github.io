---
title: "Linux Shell Commands"
date: 2019-06-14 08:26:28 +0900
categories: linux shell
---

# get line count of files
- find . -type f -exec wc -l {} \; | awk '{print $1}' | sum
