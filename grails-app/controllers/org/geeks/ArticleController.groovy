package org.geeks

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class ArticleController {
  def markdownService
  def springSecurityService
  def index = {
    def articles = Article.withCriteria {
      if(!SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")) {
        eq("published", true)
      }
      eq("deleted", false)
      order("publishedAt","DESC")
    }

    [ articles:articles ]
  }

  def show = {
    def article = params.long("id") ? Article.get(params.long("id")) : Article.findByUrl(params.url)
    [ article:article ]
  }

  @Secured(['ROLE_ADMIN'])
  def edit = {
    def article = Article.get(params.long("id"))
    render view:'form', model:[ article:article ]
  }

  @Secured(['ROLE_ADMIN'])
  def form = {
    def article = params.long("id") ? Article.get(params.long("id")) : new Article(params)
		if(!article.author)
			article.author = User.get(springSecurityService.principal.id)

    def categories = Category.withCriteria {
      eq("enabled", true)
    }

    def tags = Tag.findAll()

    [ article:article, categories:categories, tags:tags ]
  }

  @Secured(['ROLE_ADMIN'])
  def save = {
    def article = params.long("id") ? Article.get(params.long("id")) : new Article()
    if(!article.author)
      article.author = User.get(springSecurityService.principal.id)

    article.properties = params

    if(params.publish) {
      article.published = true
      article.publishedAt = new Date()
    }

    if(article.generateUrl() && article.save()) {
      flash.message = "Įrašas išsaugotas."
      redirect action:"edit", id:article.id
    } else {
      flash.message = "Nepavyko išsaugoti."
      render view:"form", model:[article:article]
    }
  }

  @Secured(['ROLE_ADMIN'])
  def delete = {
    def article = Article.get(params.long("id"))
    article.deleted = true
    if(article.save())
    {
      flash.message = "Straipsnis ištrintas."
    } else {
      flash.message = "Straipsnio ištrinti nepavyko."
    }

    redirect action:"index"
  }

  def feed = {
    render(feedType:"rss", feedVersion:"2.0") {
      title = "Geeks.lt - Straipsniai"
      link = "http://geeks.lt/feed"

      description = "Lietuvos programuotojų bendruomenės rašliava"

      Article.listed.list().each() { Article article ->
        entry(article.title) {
          link = "http://geeks.lt/article/${article.url}"
          markdownService.markdown(article.content)
        }

      }
    }
  }
}
