import UIKit


// What is closure

// Closures are self-contained blocks of functionality that can be passed around and used in your code

//Closures can capture and store references to any constants and variables from the context in which they’re defined.
// it can be called Nested functions


//closure can be variable

var great = {
    print("Good morning")
}
//call the closure
great()


//closure pass the parameters

var userName = { (name: String) in
   print(name)
}

userName("Atchu")

//Closure That Returns Value
 
var fullName = { (firstName: String , lastName: String) -> String in
    return firstName + lastName
}

fullName("Atchu", "Chitri")

//Closures as Function Parameter

//In Swift, we can create a function that accepts closure as its parameter.


func SearchByName(search:() -> ()){
    search()
}

SearchByName {
    print("Search by name")
}

//Trailing Closure

//In trailing closure, if a function accepts a closure as its last parameter,

func grabFood(message: String, search:() -> ()) {
    print(message)
    search()
}

grabFood(message: "nasik") {
}

//Autoclosure

// While calling a function, we can also pass the closure without using the braces {}.For example,

func disPlay(great: @autoclosure()->()){
    great()
}
    
disPlay(great: (
    print("Good Morning")
))


func nonEscaping(completion:() -> Void) {
    print("start")
    completion()
    print("end")
}

nonEscaping {
    print("nonEscaping")
}

func withEscaping(completion:@escaping () -> Void) {
    print("Escaping Start")
    DispatchQueue.main.asyncAfter(deadline: .now()  + 0.30) {
        print("Escaping after 30 sec")

        completion()
    }
    print("Escaping End")
}

withEscaping {
    print("Escaping")
}



func travel() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let result = travel()
result("Singapore")
result("Singapore")


