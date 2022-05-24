import Foundation

struct Service: Codable, Identifiable {
    enum Category: String, Codable {
        case base
        case media
        case utilities
        case networking
    }
    
    let id: Int
    
    let name: String
    /// The name of an SF Symbol.
    let icon: String
    let description: String
    let category: Category
    
    let dependencyNames: [String]
}
