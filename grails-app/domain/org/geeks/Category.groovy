package org.geeks

class Category {
  String name
  boolean enabled = true

  static constraints = {
    name nullable:false, blank:false
    enabled nullable:false
  }

  String toString() {
    return name
  }
}
