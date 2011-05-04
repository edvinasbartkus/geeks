dataSource {
    pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
          dbCreate = "create-drop" // one of 'create', 'create-drop','update'
          pooled = true
          url = "jdbc:mysql://localhost/geeks?useUnicode=yes&characterEncoding=UTF-8"
          diverClassName = "com.mysql.jdbc.Driver"
          username = "root"
          password = ""
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
    production {
        dataSource {
          pooled = true
          dbCreate = "update"
          url = "jdbc:mysql://localhost/geeks?useUnicode=yes&characterEncoding=UTF-8"
          diverClassName = "com.mysql.jdbc.Driver"
          username = "geeks"
          password = ""
        }
    }
}
