import UIKit

//Deep Copy duplicates the objects data

class Point {
    
    var x:Int
    var y:Int
    var shape:Shape
    
    init(x:Int,y:Int,shape:Shape) {
        self.x = x
        self.y = y
        self.shape = shape
    }
        
}
//to print human readble class
extension Point:CustomStringConvertible{
    var description: String{
        return "Point (\(x),\(y),\(shape))"
    }
}
//to refernce type being copy need to use NSCopying
extension Point:NSCopying{
    func copy(with zone: NSZone? = nil) -> Any {
        return Point.init(x: self.x, y: self.y,shape: shape.copy() as! Shape)
    }


}

class Shape{
    
    var type:String
    var size:Int
    
    init(type:String,size:Int) {
        self.type = type
        self.size = size
    }
    
}
extension Shape:NSCopying{
    func copy(with zone: NSZone? = nil) -> Any {
        return Shape.init(type: self.type, size: self.size)
    }
    
    
}
extension Shape:CustomStringConvertible{
    
    var description: String{
        return "Shape (\(type),\(size))"
    }
}


var p1 = Point(x: 0, y: 0,shape:Shape(type: "Circle", size: 33))
var p2 = p1.copy() as! Point// use copy

p2.x = 42
p2.y = 3
p2.shape.type = "Cross"
p2.shape.size = 44

print("p1:\(p1),\np2: \(p2)")

// out put

//p1:Point (0,0,Shape (Circle,33)),
//p2: Point (42,3,Shape (Cross,44))

// you can see  p1 & p2 both different because even inside shape has NSCopying protocol  this is called deep copy
