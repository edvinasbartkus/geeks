class UrlMappings {

  static mappings = {
    name notyet : "/notyet" {
      view = "notyet.gsp"
    }

    name articleShow : "/a/$url" {
      controller = "article"
      action = "show"
    }

    name articleFeed : "/feed" {
      controller = "article"
      action = "feed"
    }

    "/$controller/$action?/$id?"{
      constraints {
        // apply constraints here
      }
    }

    "/"(view:"/index")
    "500"(view:'/error')
  }
}
