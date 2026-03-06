workspace "Main Architecture Services" {

    model {
        
        u = person "User"

        !include models/mainSystem.dsl
        !include models/observabilitySystem.dsl

              
        authService -> alloy "https/json"
        scrumlyService -> alloy "https/json"  
        
        //Observability
        alloy -> loki "LogQL"
        alloy -> tempo "TraceQL" 
        alloy -> prometheus "Promql"
            
        grafana -> loki "LogQL"
        grafana -> tempo "TraceQL"
        grafana -> prometheus "Promql"


           
        //Main system 
        u -> gateway "https/json"
        
        //gateway relationships
        gateway -> authService "https/json"
        gateway -> scrumlyService "https/json"
        
        
        authService -> authRedis "tcp"
        authService -> keyklock "https/json"
 
        scrumlyService -> scrumlyDB "sql"
        scrumlyService -> scrumlyRedis "sql"
    
    }

    views {

        !include views/mainSystemView.dsl
        !include views/observabilitySystemView.dsl
        
        styles {
            element "Element" {
                color #0773af
                stroke #0773af
                strokeWidth 7
                shape roundedBox
            }
            element "Person" {
                shape person
            }
            
            element "Database" {
                shape cylinder
            }
            
            relationship "Relationship" {
                thickness 3
            }
        
        }
        
     
        
    }

}
