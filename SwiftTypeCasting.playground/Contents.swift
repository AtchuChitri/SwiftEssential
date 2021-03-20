import UIKit

var str = "Hello, playground"
//MARK:- Any Object Vs Any


//AnyObject refers to any instance of a class, and is equivalent to id in Objective-C. It’s useful when you specifically want to work with a reference type, because it won’t allow any of Swift’s structs or enums to be used. AnyObject is also used when you want to restrict a protocol so that it can be used only with classes.

//Any refers to any instance of a class, struct, or enum – literally anything at all. You’ll see this in Swift wherever types are unknown or are mixed in ways that can be meaningfully categorized:

let values: [Any] = [1, 2, "Fish"]
