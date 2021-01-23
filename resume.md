---
layout: page
title: Resume
permalink: /resume/
---


<h1>History</h1>
{% assign jobs = site.data.jobs | sort %}
{% for job_hash in jobs %}
{% assign job = job_hash[1]%}
<h2><a href="{{job.url}}">{{job.name}}</a></h2>
<h3>Title</h3>
{{ job.positions }}
<h3>Time Period</h3>
From <i> {{ job.hire}} </i> - To <i> {{ job.term }}</i>
<h3>Responsibilities</h3>
{{ job.descriptions }}
  
{% endfor %}
