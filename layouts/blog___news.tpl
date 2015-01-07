<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
{% include "SiteHeader" %}
{{blog.rss_link}}
</head>

<body{% if editmode %} class="editmode"{% endif %}>

<div id="wrap">
<div id="header" class="clearfix wrapper">

  {% include "Search" %}
    {% include "Langmenu" %}
  {% include "Mainmenu" %}


</div>
<div id="greenheader" class="edicy-dt-selectable">
  <div class="clearfix wrapper">
   <h1 id="logo" class="clearfix">{% editable site.header %}</h1>
   <h2 class="clearfix">{% content name="slogan" %}</h2>
  </div>
</div>
  {% include "MobileMenus" %}
    <div id="body" class="clearfix wrapper">

  <div class="content-block left clearfix">
    {% if tags %}
        <div class="tagged-list-header">
            <div class="header-tag-icon"></div>
            {% if tags == empty %}
                {{ "no_posts_tagged" | lc }}
            {% else %}
                {{ "posts_tagged" | lc }} '{{ tags | sort:"name" | map:"name" | join:"', '"}}'.
            {% endif %}
        </div>
    {% endif %}


   {% addbutton class="add-article" %}
   <ul id="bloglist">{% for article in articles %}
    <li>
     <h2><a href="{{article.url}}">{{article.title}}</a> <span class="date">{{article.created_at | format_date:"short"}}, {{article.created_at | format_date:"%Y"}}</span></h2>
     {{article.excerpt}}
      <ul class="postmetadata clearfix">
        <li><a href="{{article.url}}">{{"read_more"|lc}} &raquo;</a></li>
        <li><a href="{{article.url}}">{% case article.comments_count %}{% when 0 %}{{"Write_first_comment" | lc}}{% else %}{{"comments" | lc}} ({{article.comments_count}}){% endcase %}</a></li>
      </ul>
    </li>{% endfor %}
   </ul>
  </div>

  <div class="sidebar right clearfix">
   {% content name="sidebar" %}
  </div>

</div>
{% include "Footer" %}
</div>
{% include "JS" %}
</body>
</html>

