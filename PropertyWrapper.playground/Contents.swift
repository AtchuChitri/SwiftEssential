import UIKit

// What was the Property Wrapper do
// Property wrappers were introduced in Swift 5.1 to eliminate boilerplate code, facilitate code reuse, and enable more expressive APIs

//A property wrapper is nothing more than an object that encapsulates a property. It controls access to the property it wraps

@propertyWrapper
struct Trancate {
    
    private var value: String
    
    var wrappedValue: String {
        get {
           return getTrancate(value)
        }
        set {
            self.value = newValue
        }
    }
    init(wrappedValue: String) {
        self.value = wrappedValue
    }
    
    private func getTrancate(_ str: String) -> String {
        if str.count > 100 {
            return "\(str.prefix(100))" + ".."
        }
        return str
    }
}

struct Movie {
    var title: String
   @Trancate var detail: String
}

let movie = Movie(title: "Avatar", detail: "Avatar derives from a Sanskrit word meaning and when it first appeared in English in the late 18th century, it referred to the descent of a deity to the earth—typically, the incarnation in earthly form of Vishnu or another Hindu deity")

movie.detail
