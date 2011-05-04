package org.geeks

import grails.converters.JSON

class CategoryController {
    def add = {
      def name = params.name
      if(name && !Category.findByName(params.name))
        new Category(name:name, enabled:true).save()

      render Category.withCriteria { eq("enabled", true) } as JSON
    }
}
