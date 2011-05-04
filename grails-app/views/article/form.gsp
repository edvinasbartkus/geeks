<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <meta name="layout" content="main" />
    <title>${article?.title ? article.title : "Naujas straipsnis"}</title>
    <g:javascript library="article" />
  </head>
  <body>
    <g:form method="POST" action="save" class="article-form">
    <section class="main">
      <h1>${article?.title ? article.title : "Naujas straipsnis"}</h1>

        <g:if test="${article?.id}">
          <input type="hidden" name="id" value="${article?.id}" />
        </g:if>
        <g:renderErrors bean="${article}" as="list" />
        <p>
          <label for="title">Antraštė</label>
          <g:textField name="title" value="${article.title}" class="w100" />
        </p>
        <p>
          <label for="synopsis">Aprašymas</label>
          <textarea name="synopsis" id="synopsis" class="w100" cols="75">${article.synopsis}</textarea>
        </p>

        <p>
          <label for="content">Turinys</label>
          <textarea name="content" id="content" class="w100" cols="75">${article.content}</textarea>
        </p>
        <br />
          <input type="button" name="preview" value="Peržiūrėt" />
          <g:submitButton name="save" value="Išsaugoti" />

          <g:submitButton name="publish" value="Publikuoti" />

    </section>
    <aside>
      <section>
        <h2>
          <img src="${g.resource(dir:'images', file:'user.png')}" alt="Autorius">
          Autorius</h2>
        <label>
          Vardas
          <input type="text" name="author.firstname" value="${article.author?.firstname}" />
        </label>

        <label>
          Pavardė
          <input type="text" name="author.lastname" value="${article.author?.lastname}" />
        </label>

        <label>
          El. paštas
          <input type="text" name="author.email" value="${article.author?.email}" />
        </label>
      </section>

      <section>
        <h2>
          <img src="${g.resource(dir:'images',file:'folder.png')}" />
          Kategorija</h2>
        <p>
          <select name="categories" id="categories" multiple="multiple">
            <g:each in="${categories}" var="category">
              <option value="${category.id}">${category.name}</option>
            </g:each>
          </select>
        </p><p>
          <input type="text" name="newcategory" id="newcategory" value="" class="w70" />
          <input type="image" src="${g.resource(dir:'images', file:'folder_add.png')}" name="addcategory" id="addcategory" value="Save" />
        </p>
      </section>

      <section>
        <h2>
          <img src="${g.resource(dir:'images', file:'tag_blue.png')}" />
          Žymos / Tagai</h2>
        <p>
          <select name="tags" id="tags" multiple="multiple">
            <g:each in="${tags}" var="tag">
              <option value="${tag.id}">${tag.name}</option>
            </g:each>
          </select>
        </p><p>
          <input type="text" name="newtag" id="newtag" value="" class="w70" />
          <input type="image" src="${g.resource(dir:'images',file:'tag_blue_add.png')}" name="addtag" id="addtag" value="Save" />
        </p>
      </section>
    </aside>
    </g:form>
  </body>
</html>