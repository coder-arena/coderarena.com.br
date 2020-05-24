---
author: Marcos V. Leal
date: {{ now.Format "2-01-2006" }}
draft: false
title: {{ replace .Name "-" " " | title }}
slug: post-draft
description: ""
image: ""
images: []
audio: []
videos: []
tags: []
categories: []
---

Article goes here.

For other options, put these in the front matter:
  description:            "A description" other than the blog intro
  draft: true             to not publish article yet
  showDate: true/false    to enable/disable showing dates
  images: []              social image (opengraph and twitter cards)
  image: ""               theme and single page

For better seo you can set
  lastmod: 2020-4-11      after modifying an article, set lastmod to let google know
                          that you have updated the article (SEO)
  sitemap:
    changefreq: "yearly"  to let know how often article is changed
    priority: 0.9         (0-1) to show how important the page is
