<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
{% include "SiteHeader" %}
{{blog.rss_link}}
</head>

<body id="blog"{% if editmode %} class="editmode"{% endif %}>

<div id="wrap">
<div id="header" class="clearfix wrapper">
  {% include "Search" %}
    {% include "Langmenu" %}
  {% include "Mainmenu" %}


</div>
<div id="greenheader" class="edicy-dt-selectable">
  <div class="clearfix wrapper">
   <h1 id="logo" class="clearfix">{% editable site.header %}</h1>
   <div {% unless editmode %} class="left" {% endunless %}>
    <h2>{% editable article.title %} <span class="date">{{article.created_at | format_date:"long"}}</span></h2>
    <span class="post-author">{{article.author.name}}</span>
   </div>
  </div>
</div>
    {% include "MobileMenus" %}
<div id="body" class="clearfix wrapper">

  <div class="content-block left clearfix" data-search-indexing-allowed="true">
   <div class="excerpt clearfix">
    {% editable article.excerpt %}
   </div>
   {% editable article.body %}
   <br />
   {% content %}

   {% if editmode %}
            <div class="cfx article-tags" data-search-indexing-allowed="false">
                <div class="article-tag-icon"></div>
                {% editable article.tags %}
            </div>
          {% else %}
            {% unless article.tags == empty %}
                <div class="cfx article-tags" data-search-indexing-allowed="false">
                    <div class="article-tag-icon"></div>
                    {% for tag in article.tags %}
                        <a href="{{ article.page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}
                    {% endfor %}
                </div>
            {% endunless %}
        {% endif %}

   <a name="comments" data-search-indexing-allowed="false"></a>
   <div class="comments" data-search-indexing-allowed="false">
     <h3>{% case article.comments_count %}{% when 0 %}{{"no_comments"|lc}}{% else %}{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">
       {{article.comments_count}}</span>{% endcase %}</h3>
    <ul>{% for comment in article.comments %}
     <li class="edy-site-blog-comment">
      <strong class="comment-author">{{comment.author}} <span class="comment-date">{{comment.created_at | format_date:"short"}}</span></strong>{% removebutton %}
      <p class="comment-body">
       {{comment.body_html}}
      </p>
     </li>{% endfor %}
    </ul>
    <a name="add-comment"></a>
    <h3>{{"add_a_comment"|lc}}</h3>
    {% commentform %}
    {% unless comment.valid? %}<ul>
    {% for error in comment.errors %}
    <li>{{ error | lc }}</li>
    {% endfor %}
    </ul>{% endunless %}
     <p><label for="commentform-name">{{"name"|lc}}</label>
       <input type="text" class="textbox bold" id="commentform-name" value="{{comment.author}}" name="comment[author]" /></p>

     <p><label for="commentform-email">{{"email"|lc}}</label>
       <input type="text" class="textbox" id="commentform-email" value="{{comment.author_email}}" name="comment[author_email]" /></p>

     <p><label for="commentform-body">{{"comment"|lc}}</label>
       <textarea class="textbox" rows="4" cols="62" name="comment[body]">{{comment.body}}</textarea></p>

     <p><input type="submit" class="submit" value="{{"submit"|lc}}" /></p>
    {% endcommentform %}
   </div>
  </div>
    <div class="sidebar right">
   <ul class="blogmenu">
    <li>
     <a href="#comments">{% case article.comments_count %}{% when 0 %}{{"Write_first_comment" | lc}}{% else %}{{"comments" | lc}} (<span class="edy-site-blog-comments-count">{{ article.comments_count }}</span>){% endcase %}</a>
    </li>
    <li>
     <a href="#add-comment">{{"add_a_comment"|lc}}</a>
    </li>
    <li>
     <a href="{{blog.rss_url}}">RSS</a>
    </li>
   </ul>
  </div>

</div>
{% include "Footer" %}
</div>
{% include "JS" %}
</body>
</html>

