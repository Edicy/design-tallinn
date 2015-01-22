<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">
<head>
{% include "SiteHeader" %}
</head>

<body id="front"{% if editmode %} class="editmode"{% endif %}>

<div id="wrap">
	<div id="header" class="clearfix wrapper">
  {% include "Search" %}
  {% include "Langmenu" %}
  {% include "Mainmenu" %}
	</div>
	<div id="greenheader">
  <div class="clearfix wrapper">
   <h1 id="logo" class="clearfix limited-width-heading">{% editable site.header %}</h1>
   <h2 class="clearfix limited-width-heading" data-search-indexing-allowed="true">{% content name="slogan" %}</h2>
   <div class="clearfix front-content">
    <div class="content-block left clearfix" data-search-indexing-allowed="true">
     {% content %}
    </div>
    <div class="sidebar right">
     {% include "News" %}
    </div>
   </div>
  </div>
	</div>
	{% include "Footer" %}
</div>
{% include "JS" %}
</body>
</html>

