package org.geeks

class Article {
  String title
  String url

  String synopsis
  String content

  Date dateCreated
  Date lastUpdated
  Date publishedAt

  User author

  List categories
  List tags

  Date revision = new Date()
  ArticleStatus status = ArticleStatus.DRAFT

  static hasMany = [ categories:Category, tags:Tag ]

  boolean published = false
  boolean deleted = false
  static mapping = {
    version false
    synopsis type:'text'
    content type:'text'
   }

  static constraints = {
    title nullable:false, blank:false
    url nullable:false, blank:false, unique:true

    publishedAt nullable:true
    content blank:true, nullable:true

    author nullable:true, blank:true

    revision nullable:false
  }

  static namedQueries = {
    listed {
      eq "published",true
    }
  }

  def generateUrl = {
    url = title.replaceAll(' ','-').replaceAll(/[^A-Za-z0-9-]/,' ')
    true
  }
}
