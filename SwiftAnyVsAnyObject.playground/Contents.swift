import UIKit

var str = "Hello, playground"
//MARK:- Any Object Vs Any

//Swift has two anonymous types: Any and AnyObject. They are subtly different, and you will need to use both sooner or later.

//AnyObject refers to any instance of a class, and is equivalent to id in Objective-C. It’s useful when you specifically want to work with a reference type, because it won’t allow any of Swift’s structs or enums to be used. AnyObject is also used when you want to restrict a protocol so that it can be used only with classes.

//Any refers to any instance of a class, struct, or enum – literally anything at all. You’ll see this in Swift wherever types are unknown or are mixed in ways that can be meaningfully categorized:

//MARK:- Syntax of Any
protocol publicService : Any {
    
}
//MARK:- Example of Any
struct farmingNeeds: publicService {
    
}

//MARK:- Syntax of AnyObject
protocol privateService : AnyObject {
    
}

//We can't use below
//struct farmingNeeds2: privateService { //Non-class type 'farmingNeeds2' cannot conform to class protocol 'privateService'
//
//}

//MARK:- Example of Any Object
class softwareServices : privateService {
    
}



let values: [Any] = [1, 2, "Fish"]
let anyvalues:[Any] = ["Apple", 99, "Zaphod", -1]

for value in anyvalues
{
    switch value {
    case is String:
        print("\(value) is a string!")
    case is Int:
        print("\(value) is an integer!")
    default:
        print("I don't know this value!")
    }
}

/* output:
 Apple is a string!
 99 is an integer!
 Zaphod is a string!
 -1 is an integer!
 */
//The Difference Between Any And AnyObject
//Any is used for both value and reference types, such as structs, Int, String, etc. and can also be used for classes, functions and closures
//AnyObject is used for reference types, i.e. classes

//Note : AnyObject is only for reference types (classes), Any is for both value and reference types.

/*
Whether you use Any or AnyObject depends on your intended use:

If your dictionary will be used only within Swift code, then you should use Any because your types (Int, Double, Float, String, Array, and Dictionary) are not objects.

If you will be passing your dictionary to Objective-C routines that expect an NSDictionary, then you should use AnyObject.

When you import Foundation or import UIKit or import Cocoa, it is possible to declare your array as [String: AnyObject], but in this case Swift is treating your Int, Double, Float literals as NSNumber, your Strings as NSString, your Arrays as NSArray, and your dictionaries as NSDictionary, all of which are objects. A dictionary using AnyObject as the value type is convertible to NSDictionary, but one using Any is not.
*/
//========================================================

                    //Any Vs AnyObject -  2nd Example

//========================================================

//In Swift language, you have 2 anonymous types:
//
//Any can represent an instance of any type at all, including function types
//AnyObject can represent an instance of any class type and is equivalent to id in Objective-C.
//Example:

struct ColorName {
    let color: String
}
 
let colorStruct = ColorName(color: "White")
 
let thevalues:[Any] = ["Milan", 29, colorStruct]
 
for value in thevalues
{
    switch value {
    case is String:
        print("\(value) is a string!")
    case is Int:
        print("\(value) is an integer!")
    default:
        print("I don't know this value!")
    }
}
 
/*
Output:
Milan is a string!
29 is an integer!
I don't know this value!

Note:
If possible, avoid both Any and AnyObject in your code – it’s better to be more specific if you can be.
*/


//=======================================================================================================

                    //Any Vs AnyObject Vs NSObject -  3rd Example

//=======================================================================================================
//Source: https://baotrandotco.wordpress.com/2018/04/09/any-vs-anyobject-vs-nsobject/
//iOS: Any vs. AnyObject vs. NSObject
//Recently, I had minor hiccup at work not knowing the difference between Any vs. AnyObject vs. NSObjects. Are they not the same? Well, not quite – after digging into each of them, not only did I find the difference, I also found their uses!
//****************************************************************************************************
                       // Any
//‘Any’ includes all objects; including function types.
//Is not a concrete data type. ‘Any’ is an alias for any data type.
//As you can see above, the ‘anyCollection’ will allow any type of objects, whether or not they share the same class or type.

//****************************************************************************************************
let anyCollection: Any = ["String", 1, ("tuple", "tuple")]
print(anyCollection)
/*
 Output:
 ["String", 1, ("tuple", "tuple")]
 */
//****************************************************************************************************
                       // AnyObject
//‘AnyObject’ are objects derived from classes.
//Is an alias for any instance derived from any class type.
//Is Objective-C’s ‘id’.
//With AnyObjects, they must be instances of a class, so objects such as a strings or value will throw up an error.
//You can put [Any] in lieu of [AnyObject] to be more broad.

//****************************************************************************************************
class FooClass {
}

class BarClass {
}
let fooInstance = FooClass()
let barInstance = BarClass()

let anyObjectCollection: [AnyObject] = [fooInstance, barInstance]
print(anyObjectCollection)
/*
 Output:
 [__lldb_expr_5.FooClass, __lldb_expr_5.BarClass]
 */
//****************************************************************************************************
                       // NSObject
//Foundation Objects, NSString, NSNumber, NSData, NSDate, JSONSerialization, DateFormatter, etc.
//These are Objective-C types, Swift has data types that can be bridged by importing the Foundation framework (part of the UIKit Framework).
//For the nsobjectCollection below, anything that has a root class or NSObject is valid.
//****************************************************************************************************
let nsobjectCollection: [NSObject] = [1 as NSNumber, "String" as NSString]
print(nsobjectCollection)
/*
 output :
 [1, String]

 */
