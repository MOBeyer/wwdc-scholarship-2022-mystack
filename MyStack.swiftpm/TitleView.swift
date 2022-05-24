import SwiftUI

struct TitleView: View {
    @EnvironmentObject var serviceModel: ServiceModel
    
    @State private var showingIntroduction = true
    @State private var showingDiagram = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(serviceModel.baseServices) { service in
                        ServiceOption(service: service)
                    }
                } header: {
                    Text("Base services")
                } footer: {
                    Text("The above services are either essential for administrating my server, or a dependency of most or all other services.")
                }
                
                Section {
                    ForEach(serviceModel.mediaServices) { service in
                        ServiceOption(service: service)
                    }
                } header: {
                    Text("Media")
                }
                
                Section {
                    ForEach(serviceModel.utilityServices) { service in
                        ServiceOption(service: service)
                    }
                } header: {
                    Text("Utilities")
                }
                
                Section {
                    ForEach(serviceModel.networkingServices) { service in
                        ServiceOption(service: service)
                    }
                } header: {
                    Text("Networking")
                }
            }
            .navigationTitle("My Stack")
            .toolbar {
                Button {
                    showingDiagram = true
                } label: {
                    Text("Diagram")
                }
            }
            .popover(isPresented: $showingDiagram) {
                ServiceDiagramView()
            }
            .popover(isPresented: $showingIntroduction) {
                IntroductionView()
            }
        }
    }
    
    struct ServiceOption: View {
        let service: Service
        
        var body: some View {
            NavigationLink {
                ServiceView(service: service)
            } label: {
                Text(service.name)
            }
        }
    }
    
    struct IntroductionView: View {
        @Environment(\.presentationMode) var presentationMode
        
        var body: some View {
            VStack {
                Spacer()
                
                Text("Welcome to My Stack")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                HStack(alignment: .center) {
                    Image(systemName: "cloud")
                        .foregroundColor(.accentColor)
                        .imageScale(.large)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Self-hosted")
                            .font(.headline)
                        
                        Text("I self-host various services on my personal server, which is like hosting a mini-cloud for myself.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(alignment: .leading)
                    
                    Spacer()
                }
                .padding()
                
                HStack(alignment: .center) {
                    Image(systemName: "book")
                        .foregroundColor(.accentColor)
                        .imageScale(.large)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Documentation")
                            .font(.headline)
                        
                        Text("This playground introduces you to some of the services I host, documenting what each one does and the relationships between them.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .frame(alignment: .leading)
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Spacer()
                        Text("Continue")
                            .font(.headline)
                        Spacer()
                    }
                    .padding(18)
                    .foregroundColor(Color(.label))
                    .background(.blue)
                    .cornerRadius(12)
                }
                .padding()

            }
        }
    }
}
