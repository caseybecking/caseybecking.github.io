---
layout: page
title: Resume
permalink: /resume/
---

<div>
<h1>History</h1>
<hr>
{% assign jobs = site.data.jobs | sort | reverse %}
{% for job_hash in jobs %}
{% assign job = job_hash[1]%}
<h3><a href="{{job.url}}">{{job.name}}</a></h3>
<p><b>Title :</b> {{ job.positions }}</p>
<p><b>Time Period :</b> From <i> {{ job.hire}} </i> - To <i> {{ job.term }}</i></p>
<p><b>Responsibilities :</b><ul>{% for jb in job.descriptions %}<li>{{ jb }}</li>{% endfor %}</ul></p>
  
{% endfor %}
</div>