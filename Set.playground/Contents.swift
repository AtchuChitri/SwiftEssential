import UIKit
import Foundation

// Set and all the features
//An unordered collection of unique elements.
// compare to array Set faster becasue of no order


let iosDev:Set = ["Atchu", "Girish", "Naveen","Nari"]
let androidDev:Set = ["Suri","Rama","Titus","Koti"]
let webDev:Set = ["Nari","Koti"]
let pythonDev:Set = ["Atchu", "Girish"]


///Use the contains(_:) method to test whether a set contains a specific element.

iosDev.contains(androidDev) // false because there is no same data
iosDev.contains(pythonDev) // true because same users in both tech

///Use the intersection(_:) method to create a new set with only the elements common to a set and another set or sequence.
iosDev.intersection(pythonDev)

/// Use the “equal to” operator (==) to test whether two sets contain the same elements.

iosDev == pythonDev

/// Use the isSubset(of:) method to test whether a set contains all the elements of another set or sequence.

pythonDev.isSubset(of: iosDev)
// true because python dev complete in iosDev
iosDev.isSubset(of: pythonDev) // false

/// Use the isSuperset(of:) method to test whether all elements of a set are contained in another set or sequence.

pythonDev.isSuperset(of: iosDev)//false
iosDev.isSuperset(of: pythonDev) // true


///Use the isStrictSubset(of:) and isStrictSuperset(of:) methods to test whether a set is a subset or superset of, but not equal to, another set.

iosDev.isStrictSubset(of: pythonDev) // false
pythonDev.isStrictSubset(of: iosDev) // true

///Use the isDisjoint(with:) method to test whether a set has any elements in common with another set.

iosDev.isDisjoint(with: pythonDev) // false because there are common elements
androidDev.isDisjoint(with: iosDev) // true because no common elements

///Use the union(_:) method to create a new set with the elements of a set and another set or sequence.

iosDev.union(androidDev)
// combine all elements
iosDev.union(pythonDev)

/// Use the intersection(_:) method to create a new set with only the elements common to a set and another set or sequence.

iosDev.intersection(pythonDev) // common dev's

/// Use the symmetricDifference(_:) method to create a new set with the elements that are in either a set or another set or sequence, but not in both.

iosDev.symmetricDifference(pythonDev)

//uncommon data

iosDev.symmetricDifference(androidDev)

/// Use the subtracting(_:) method to create a new set with the elements of a set that are not also in another set or sequence.

iosDev.subtracting(pythonDev)

iosDev.subtracting(androidDev)

