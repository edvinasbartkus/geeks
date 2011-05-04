package org.geeks

import grails.converters.JSON

class TagController {
    def add = {
      String name = params.name
      if(name && !Tag.findByName(name))
        new Tag(name:name).save()

      render Tag.findAll() as JSON
    }
}
