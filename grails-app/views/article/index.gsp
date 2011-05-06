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
				<div class="content">
          <h2>
            <g:link mapping="articleShow" params="[url:article.url]">
              ${article.title}
            </g:link>
          </h2>
          <div class="synopsis">${article.synopsis}</div>
				</div>
				<div class="author">
					<g:if test="${article.author}">
						<g:if test="${article.author?.email}">
						<avatar:gravatar email="${article.author?.email}" size="60" />
						</g:if>
						<span class="name">
							${article.author?.firstname}<br />
							${article.author?.lastname}
						</span>
						<g:if test="${article.published}">
							${article.publishedAt}.
						</g:if>
						<sec:ifAllGranted roles="ROLE_ADMIN">
						<br clear="all" />
						<div class="control-buttons">
								<g:link action="edit" id="${article.id}">Redaguoti</g:link><br />
								<g:link action="delete" id="${article.id}">Ištrinti</g:link>
						</div>
						</sec:ifAllGranted>
					</g:if>
					<span class="article-meta">
						<g:if test="${article.categories}">
							Kategorija: ${article.categories.join(', ')}.
						</g:if>
					</span>
				</div>
				<br clear="all" />
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
