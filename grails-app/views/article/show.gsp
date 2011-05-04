<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title>${article.title}</title>
    <meta name="layout" content="main" />
    </head>
  <body>
    <article>
      <h1>${article.title}</h1>
      <div class="article-meta">
        <g:if test="${article.publishedAt}">
        Publikuotas ${article.publishedAt}
        </g:if>
        <g:if test="${article.categories}">
        kategorijoje ${article.categories.join(", ")}
         </g:if>
      </div>
      <section>
        <markdown:renderHtml>${article.content}</markdown:renderHtml>
      </section>
      <aside>
        <h2>Autorius</h2>
        <g:if test="${article.author?.email}">
          <avatar:gravatar email="${article.author?.email}" />
        </g:if>
        ${article.author?.firstname}
        ${article.author?.lastname}
      </aside>
      <br clear="all" />
      <disqus:comments bean="${article}" />
    </article>
  </body>
</html>