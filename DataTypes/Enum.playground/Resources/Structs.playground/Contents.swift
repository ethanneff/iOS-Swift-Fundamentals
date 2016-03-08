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