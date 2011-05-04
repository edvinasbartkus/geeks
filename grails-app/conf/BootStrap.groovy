import org.geeks.Role
import org.geeks.User
import org.geeks.UserRole
import grails.util.GrailsUtil

class BootStrap {
  def grailsApplication
  def springSecurityService
  def init = { servletContext ->
    if(GrailsUtil.environment == "development") {
      def adminRole = new Role(authority: "ROLE_ADMIN").save(flush: true)
      def userRole = new Role(authority: "ROLE_USER").save(flush: true)

      assert grailsApplication.config.grails.users.defaultPassword
      String password = springSecurityService.encodePassword(grailsApplication.config.grails.users.defaultPassword)

      def adminUser = new User(username:'admin', enabled:true, password:password).save(flush: true, failOnError: true)
      UserRole.create adminUser, adminRole, true
    }
  }
  def destroy = {
  }
}
