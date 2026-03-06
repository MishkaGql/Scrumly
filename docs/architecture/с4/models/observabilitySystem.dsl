observabilitySystem = softwareSystem "Observability" {

    observabilityCollector = container {
        tags "ObservabiliyCollector"
    }    

    grafana = container "Grafana", "Shows a visual representation loki,traces,metrics" {
        tags "Observability", "Grafana"
        technology "Grafana"
    }
            
    alloy = container "Alloy", "Centralized managment with loki,traces,metrics" {
        tags "Observability", "Alloy"
    }

    observabilityCollectors = group "Observability Collectors" {
            
        prometheus = observabilityCollector "Prometheus" "Collect metrics " {
            tags "Prometheus", "Database"
            technology "Prometheus"
        }
            
        loki = observabilityCollector "Loki", "Collect logs from services" {
            tags "Loki", "Database"
            technology "Loki"
        }
            
        tempo = observabilityCollector "Tempo" {
            tags  "Tempo", "Database"
            technology "Grafana"
        }
    }           
}