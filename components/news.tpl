{% for a in site.latest_1_articles %}<dl class="news">
	<dt>{{"latest_news"|lc}}</dt>{% for article in site.latest_5_articles %}
	<dd>
  <a href="{{article.url}}">{{article.title}}</a> {{article.created_at | format_date:"short"}}
	</dd>{% endfor %}
</dl>
{% endfor %}
