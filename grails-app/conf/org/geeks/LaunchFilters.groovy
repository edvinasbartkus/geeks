package org.geeks

class LaunchFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
              if(params.letmein || session.letmein) {
                session.letmein = true
              } else {
                redirect uri: "/notyet"
              }
            }
            after = {
                
            }
            afterView = {
                
            }
        }
    }
    
}
