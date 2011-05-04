package org.geeks

class User {
  String username
  String password

  String email

  String firstname
  String lastname

  String twitter
  String github

  boolean enabled = true
  boolean accountExpired
  boolean accountLocked
  boolean passwordExpired

  static constraints = {
    username blank: false, unique: true
    password blank: false

    firstname blank:true, nullable:true
    lastname blank:true, nullable:true

    email blank:true, nullable:true

    twitter nullable:true, blank:true
    github nullable:true, blank:true
  }

  static mapping = {
    password column: '`password`'
  }

  Set<Role> getAuthorities() {
    UserRole.findAllByUser(this).collect { it.role } as Set
  }

  String toString() {
    return "${firstname} ${lastname}"
  }
}
