<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <meta name="layout" content="main" />
    <title>Straipsniai</title>
  </head>
  <body>
    <ul class="articles">
    <g:each in="${articles}" var="article">
      <li>
          <h2>
            <g:link mapping="articleShow" params="[url:article.url]">
              ${article.title}
            </g:link>
          </h2>
          <div class="synopsis">${article.synopsis}</div>

          <div class="author">
            <g:if test="${article.author}">
              Autorius
              <g:if test="${article.author?.email}">
              <avatar:gravatar email="${article.author?.email}" size="15" />
              </g:if>
              ${article.author?.firstname}
              ${article.author?.lastname}.
            </g:if>
            <span class="article-meta">
              <g:if test="${article.published}">
                Publikuota ${article.publishedAt}.
              </g:if>
              <g:if test="${article.categories}">
                Kategorija: ${article.categories.join(', ')}.
              </g:if>
            </span>

          </div>

          <sec:ifAllGranted roles="ROLE_ADMIN">
          <div class="control-buttons">
            <span>
              <g:link action="edit" id="${article.id}">Redaguoti</g:link>
              <g:link action="delete" id="${article.id}">Ištrinti</g:link>
            </span>
          </div>
          </sec:ifAllGranted>

      </li>
    </g:each>
    </ul>
    <br clear="all" />
      <g:link mapping="articleFeed">
        <image src="${g.resource(dir:'images',file:'rss.png')}" class="rss" />
      </g:link>


  <sec:ifAllGranted roles="ROLE_ADMIN">
    <br />
    <g:link action="form">Naujas straipsnis</g:link>
  </sec:ifAllGranted>
  </body>
</html>