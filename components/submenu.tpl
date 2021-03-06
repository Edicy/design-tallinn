{% for item in site.menuitems %}{% if item.selected? %}{% if editmode %}
<ul id="submenu" class="clearfix"><li{% if item.current? %} class="active"{% endif %}><a href="{{item.url}}">{{item.title}}</a></li>{% for l2 in item.visible_children %}
<li{% if l2.selected? %} class="active"{% endif %}{% unless l2.translated? %} class="untranslated"{% endunless %}>
  <a href="{{l2.url}}"{% unless l2.translated? %} class="fci-editor-menuadd"{% endunless %}>{{l2.title}}</a>{% if l2.selected? %}
  <ul id="thirdmenu">{% for l3 in l2.visible_children %}
   <li{% if l3.selected? %} class="active"{% endif %}{% unless l3.translated? %} class="untranslated"{% endunless %}>
    <a href="{{l3.url}}"{% unless l3.translated? %} class="fci-editor-menuadd"{% endunless %}>{{l3.title}}</a>
   </li>{% endfor %}
   <li>{% menubtn l2.hidden_children %}</li>     
   <li>
    {% menuadd parent="l2" %}
   </li>
  </ul>{% endif %}
</li>{% endfor %}
<li>{% menubtn item.hidden_children %}</li>
<li>
{% menuadd parent="item" %}
</li>
</ul>
{% else %}{% if item.children? %}
<ul id="submenu" class="clearfix"><li{% if item.current? %} class="active"{% endif %}><a href="{{item.url}}">{{item.title}}</a></li>{% for l2 in item.children %}
<li{% if l2.selected? %} class="active"{% endif %}>
  <a href="{{l2.url}}">{{l2.title}}</a>{% if l2.selected? %}{% if l2.children? %}
  <ul id="thirdmenu">{% for l3 in l2.children %}
   <li{% if l3.selected? %} class="active"{% endif %}>
    <a href="{{l3.url}}">{{l3.title}}</a>
   </li>{% endfor %}
  </ul>{% endif %}{% endif %}
</li>{% endfor %}
</ul>
{% endif %}{% endif %}{% endif %}{% endfor %}

