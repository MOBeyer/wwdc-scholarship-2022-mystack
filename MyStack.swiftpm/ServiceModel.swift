import Foundation

class ServiceModel: ObservableObject {
    @Published var services: [Service] = [Service]()
    
    init() {
        guard let fileURL = Bundle.main.url(forResource: "services", withExtension: "json") else {
            fatalError("Services file not found.")
        }
        guard let data = try? Data(contentsOf: fileURL) else {
            fatalError("Could not load services file.")
        }
        let decoder = JSONDecoder()
        guard let decoded = try? decoder.decode([Service].self, from: data) else {
            fatalError("Could not decode services file.")
        }

        services = decoded
    }
    
    func getDependents(of service: Service) -> [Service] {
        services.filter {
            $0.dependencyNames.contains(service.name)
        }
    }
    
    func getDependencies(of service: Service) -> [Service] {
        services.filter {
            service.dependencyNames.contains($0.name)
        }
    }
    
    var baseServices: [Service] {
        services.filter({$0.category == .base})
    }
    
    var mediaServices: [Service] {
        services.filter({$0.category == .media})
    }
    
    var networkingServices: [Service] {
        services.filter({$0.category == .networking})
    }
    
    var utilityServices: [Service] {
        services.filter({$0.category == .utilities})
    }
}
