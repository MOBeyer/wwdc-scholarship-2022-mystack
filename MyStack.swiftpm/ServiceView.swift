import SwiftUI

struct ServiceView: View {
    @EnvironmentObject var serviceModel: ServiceModel
    let service: Service
    
    var body: some View {
        Form {
            VStack {
                if !service.icon.isEmpty {
                    Image(systemName: service.icon)
                        .font(.system(size: 50))
                        .padding()
                } else {
                    Text(service.icon)
                        .font(.system(size: 50))
                        .padding()
                }
                
                Text(service.description)
                    .frame(alignment: .leading)
                    .padding(.bottom)
            }
            
            ConnectedServiceSection(name: "Dependencies", services: serviceModel.getDependencies(of: service))
            ConnectedServiceSection(name: "Dependents", services: serviceModel.getDependents(of: service))
        }
        .navigationTitle(service.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    struct ConnectedServiceSection: View {
        let name: String
        let services: [Service]
        
        var body: some View {
            Section {
                ForEach(services) { service in
                    NavigationLink(service.name) {
                        ServiceView(service: service)
                    }
                }
                
                if services.isEmpty {
                    Text("*Nothing is here.*")
                        .foregroundColor(.secondary)
                }
            } header: {
                Text(name)
            }
        }
    }
}
