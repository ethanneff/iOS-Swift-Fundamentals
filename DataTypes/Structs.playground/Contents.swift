////////////////////
// STRUCTS
////////////////////
struct Point {
  var x: Int
  var y: Int
  
  init(x: Int, y: Int) {
    self.x = x
    self.y = y
  }
}

var point1 = Point(x: 0, y: 0)

var point2 = point1 // creates a new instance

point1.x = 10

point1.x // 10
point2.x // 0



////////////////////////
// STRUCTS
////////////////////////

struct Point {
  // stored properties (are init automatically when instance is created)
  let x: Int
  let y: Int
  
  init(x: Int, y:Int) {
    self.x = x
    self.y = y
  }
  
  // instance method
  func surroundingPoints(range range: Int = 1) -> [Point] {
    var results: [Point] = []
    
    for h in x-range...x+range {
      for v in y-range...y+range {
        if h >= 0 && v >= 0 {
          let item = Point(x: h, y: v)
          results.append(item)
        }
      }
    }
    return results
  }
}

let coordinatePoint = Point(x: 2, y: 2) // instance
coordinatePoint.x
coordinatePoint.surroundingPoints(range: 2)