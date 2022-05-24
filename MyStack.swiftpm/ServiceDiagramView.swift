import SwiftUI
import SunburstDiagram

struct ServiceDiagramView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var serviceModel: ServiceModel
    
    var baseNodes: [Node] {
        serviceModel.baseServices.map { service in
            Node(name: service.name, image: UIImage(systemName: service.icon), backgroundColor: .systemPurple)
        }
    }
    
    var mediaNodes: [Node] {
        serviceModel.mediaServices.map { service in
            Node(name: service.name, image: UIImage(systemName: service.icon), backgroundColor: .systemRed)
        }
    }
    
    var utilityNodes: [Node] {
        serviceModel.utilityServices.map { service in
            Node(name: service.name, image: UIImage(systemName: service.icon), backgroundColor: .systemBrown)
        }
    }
    
    var networkingNodes: [Node] {
        serviceModel.networkingServices.map { service in
            Node(name: service.name, image: UIImage(systemName: service.icon), backgroundColor: .systemGreen)
        }
    }
    
    var sunburstConfiguration: SunburstConfiguration {
        SunburstConfiguration(nodes: [
            Node(name: "Base", children: baseNodes),
            Node(name: "Media", children: mediaNodes),
            Node(name: "Utilities", children: utilityNodes),
            Node(name: "Networking", children: networkingNodes)
        ])
    }
    
    var body: some View {
        NavigationView {
            
            SunburstView(configuration: sunburstConfiguration)
                .navigationTitle("Service Diagram")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Done")
                            .bold()
                    }
                }
        }
    }
}
