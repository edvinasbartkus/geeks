package org.geeks

class Tag {
  String name

  static constraints = {
    name nullable:false, blank:false
  }

  String toString() {
    return name
  }
}
