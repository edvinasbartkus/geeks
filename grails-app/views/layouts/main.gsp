<!DOCTYPE html>
<html>
  <head>
    <meta charset='UTF-8'>
    <meta name="tags" content="Geeks, Developers, Lietuvos programuotojai, Programavimas, Geekai" />
    <title><g:layoutTitle default="Geeks.lt" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script type="text/javascript">
    prefix = '${g.resource(dir:"")}';
    </script>
    <g:javascript library="jquery" plugin="jquery"/>
    <g:javascript src="jquery.autogrow.js" />
    <g:javascript library="application" />
    <g:layoutHead />
  </head>
  <body>
    <header>
      <a href="${g.resource(dir:'')}">
        <img src="${g.resource(dir:"images", file:"logo.png")}" />
      </a>
    </header>
    <section>
      <g:if test="${flash.message}">
        <div class="notice">
          ${flash.message}
        </div>
        <br />
      </g:if>
      <g:layoutBody />
      <br clear="all" />
    </section>
    <footer>
      <img src="${g.resource(dir:"images", file:"cc.logo.png")}" alt="Creative commons" title="Creative commons" />
    </footer>
  </body>
</html>