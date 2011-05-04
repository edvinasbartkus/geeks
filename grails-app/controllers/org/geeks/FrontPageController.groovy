package org.geeks

class FrontPageController {

  def index = {
    def articles = Article.listed.list()

    [ article:articles ]
  }
}
