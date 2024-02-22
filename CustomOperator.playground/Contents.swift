
/*
 Make a custom map & filter & reduce
 */

extension Sequence {
    
    func customMap<T>(_ value:(Element) throws -> T ) rethrows -> [T] {
        var results = [T]()
        for item in self {
            results.append(try value(item))
        }
        return results
    }
    
    func customFilter(_ isIncluded: (Element) throws -> Bool ) rethrows -> [Element] {
        var results = [Element]()
        for val in self {
            if try isIncluded(val) {
                results.append(val)
            }
        }
        return results
    }
    
    func customReduce<T>(_ initialResult:(T),_ nextResult:@escaping(T,Self.Element) throws -> T ) rethrows -> T {
        var result = initialResult
        for val in self {
            result = try nextResult(result,val)
        }
        return result
    }
}

let arr = ["Atchu", "Karuna","Aarohi","Viraaj"]
print(arr.customReduce("", {$0 + "," + $1}))
