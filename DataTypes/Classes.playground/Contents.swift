////////////////////
// CLASSES
////////////////////
enum Gender: String {
  case Male = "male", Female = "female"
}

class Person {
  var gender: String = Gender.Male.rawValue
  var firstName: String?
  var lastName: String?
  
  init(gender: Gender) {
    self.gender = gender.rawValue
  }
}

var person1 = Person(gender: .Female) // dot shorthand for enum type

person1.firstName = "Jane"
person1.lastName = "Doe"

var person2 = person1 // both reference the same instance

person1.firstName = "Janine"

person1.firstName // Janine
person2.firstName // Janine



////////////////////////
// CLASSES
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


class Enemy {
  var life: Int = 2
  let position: Point
  
  
  init(x: Int, y: Int) {
    self.position = Point(x: x, y: y)
  }
  
  func decreaseHealth(factor factor: Int) {
    life -= factor
  }
}

class SuperEnemy: Enemy {
  let isSuper: Bool
  
  override init(x: Int, y: Int) {
    self.isSuper = true
    super.init(x: x, y: y)
    self.life = 50
  }
  
}

class Tower {
  let position: Point
  var range: Int = 1
  var strength: Int = 1
  
  init(x: Int, y: Int) {
    self.position = Point(x: x, y: y)
  }
  
  func fireAtEnemy(enemy: Enemy)  {
    if inRange(position: self.position, range: self.range, target: enemy.position) {
      while enemy.life > 0 {
        enemy.decreaseHealth(factor: strength)
        print("enemy damaged!")
      }
    } else {
      print("enemy out of range")
    }
  }
  
  func inRange(position position: Point, range: Int, target: Point) -> Bool {
    let availablePositions = position.surroundingPoints(range: range)
    for point in availablePositions {
      if point.x == target.x && point.y == target.y {
        return true
      }
    }
    return false
  }
}

class LaserTower: Tower {
  override init(x: Int, y: Int) {
    super.init(x: x, y: y)
    self.range = 100
    self.strength = 100
  }
  
  override func fireAtEnemy(enemy: Enemy) {
    while enemy.life > 0 {
      enemy.decreaseHealth(factor: strength)
    }
    print("enemy vanquished!")
  }
}

// instances
let tower1 = Tower(x: 0, y: 0)
let tower2 = LaserTower(x: 0, y: 0)
let enemy1 = Enemy(x: 3, y: 1)
let enemy2 = Enemy(x: 1, y: 1)
let enemy3 = SuperEnemy(x: 2, y: 2)

tower1.fireAtEnemy(enemy1)
tower1.fireAtEnemy(enemy2)
tower2.fireAtEnemy(enemy3)

