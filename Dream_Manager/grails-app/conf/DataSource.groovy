dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            url = "jdbc:mysql://localhost/dream_manager_development"
			username = "dream_manager"
			password = ""
        }
		hibernate {
			show_sql = true
		}
    }
    test {
        dataSource {
            url = "jdbc:mysql://localhost/dream_manager_test"
			username = "dream_manager"
			password = ""
        }
    }
    production {
        dataSource {
            url = "jdbc:mysql://localhost/dream_manager"
			username = "dream_manager"
			password = ""
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
