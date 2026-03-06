mainSystem = softwareSystem "Scrumly System" {
                  
    archetypes {
        
        database = container {
            tags "Database"
        }
            
        service = container {
            tags "Service"
        }
            
        redis = database {
            tags "Redis"
        }
    }    

    gateway = service "Api Gateway", "Centralized service to management all other services" {
        tags "Centralized", "ApiGateway"
        technology "Spring boot Gateway"
    }
            
    scrumlyStructure = group "Scrumly Service Architecture" {
            
        scrumlyService = service "Scrumly Service", "Service that handles all basic requests" {
            tags "Spring Boot Service", "ScrumlyService"
            technology "Spring Boot Service"
        }
                
        scrumlyDB = database "Scrumly Database", "Main db for store data" {
            tags "ScrumlyDB"
            technology "PostgreSQL"
        }
                
        scrumlyRedis = redis "Scrumly Redis" {
            tags "ScrumlyRedis"
            technology "Redis"
        }
    }
    authStructure = group "Authentification Services Architecture" {
         
        authService = service "Auth Service", "Integrated with keyklock to managment authentification" {
            tags "AuthService"
            technology "Spring Boot Service"
        }
            
        authRedis = redis "Auth Redis", "Store tokens,sessions, rate-limiting" {
            tags "AuthRedis"
            technology "AuthRedis"
        }
            
        keyklock = service "Keyklock", "Centralized authentification system" {
            tags "Keyklock" "Centralized"
            technology "Keyclock"
        }
    }
}