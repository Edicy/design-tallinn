<ul class="floatlist left clearfix" id="mainmenu">
	{% unless site.root_item.hidden? %}<li{% if site.root_item.selected? %} class="active"{% endif %}>
  <a href="{{site.root_item.url}}">{{site.root_item.title}}</a>
   {% if site.root_item.selected? %}<ins class="menu-spike"></ins>{% endif %}
	</li>{% endunless %}{% for item in site.visible_menuitems %}
	<li{% if item.selected? %} class="active"{% endif %}{% unless item.translated? %} class="untranslated"{% endunless %}>
   <a href="{{item.url}}"{% unless item.translated? %} class="fci-editor-menuadd"{% endunless %}>{{item.title}}</a>
   {% if item.selected? %}<ins class="menu-spike"></ins>{% endif %}
	</li>{% endfor %}{% if editmode %}
   {% if editmode %}<li>{% menubtn site.hidden_menuitems %}</li>{% endif %}
   <li>{% menuadd %}</li>{% endif %}
</ul>

