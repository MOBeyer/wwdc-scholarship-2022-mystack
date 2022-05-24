import SwiftUI

@main
struct MyStackApp: App {
    @StateObject var serviceModel = ServiceModel()
    
    var body: some Scene {
        WindowGroup {
            TitleView()
                .environmentObject(serviceModel)
        }
    }
}
