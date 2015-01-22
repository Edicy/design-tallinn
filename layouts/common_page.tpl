<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">
<head>
{% include "SiteHeader" %}
</head>

<body id="common"{% if editmode %} class="editmode"{% endif %}>

<div id="wrap">
	<div id="header" class="clearfix wrapper">

   {% include "Search" %}
     {% include "Langmenu" %}
  {% include "Mainmenu" %}


	</div>
	<div id="greenheader" class="edicy-dt-selectable">
  <div class="clearfix wrapper">
   <h1 id="logo" class="clearfix">{% editable site.header %}</h1>
   <h2 class="clearfix content-hyphenate" data-search-indexing-allowed="true">{% content name="slogan" %}</h2>
  </div>
	</div>
     {% include "MobileMenus" %}
	<div id="body" class="clearfix wrapper">

  <div class="content-block left clearfix content-hyphenate" data-search-indexing-allowed="true">
   {% content %}
  </div>
   <div class="sidebar right content-hyphenate">
   {% include "Submenu" %}
   {% include "News" %}
  </div>

	</div>
	{% include "Footer" %}
</div>
{% include "JS" %}
</body>
</html>
