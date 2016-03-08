import Foundation

///////////////////
// PROTOCOLS
///////////////////
protocol Placeable {
  var position:Location { get set }
}

protocol Moveable {
  func move()
}

protocol Damagable {
  var health:Int { get set }
  func decreaseHealth(amount amount:Int)
}

protocol Attackable {
  var strength:Int { get set }
  var range:Int { get set }
  func increaseStrength(amount amount:Int)
}

protocol Upgradeable {
  func levelUp()
}


enum LocationStatus {
  case Available
  case Taken
  case Tower
}




///////////////////
// GAME OBJECTS
///////////////////
struct Location {
  let x: Int
  let y: Int
  
  init(x: Int, y:Int) {
    self.x = x
    self.y = y
  }
  
  func surroundingPoints(range range:Int) -> [Location] {
    var results: [Location] = []
    for h in x-range...x+range {
      for v in y-range...y+range {
        if h >= 0 && v >= 0 {
          let item = Location(x: h, y: v)
          results.append(item)
        }
      }
    }
    return results
  }
}

class Board {
  let width:Int
  let height:Int
  var field:[Location]
  
  init(width:Int, height:Int) {
    self.width = width
    self.height = height
    self.field = [Location]()
    
    generateField()
  }
  
  private func generateField() {
    for x in 0..<width {
      for y in 0..<height {
        field.append(Location(x: x, y: y))
      }
    }
  }
  
}

class Enemy: Placeable, Moveable, Damagable {
  var health:Int = 2
  var position:Location
  
  init(x:Int, y:Int) {
    self.position = Location(x: x, y: y)
  }
  
  func decreaseHealth(amount amount: Int) {
    health -= amount
  }
  
  func move() {
    
  }
}

class Tower: Placeable, Attackable {
  var position:Location
  var strength:Int = 1
  var range:Int = 1
  
  init(x: Int, y:Int) {
    self.position = Location(x: x, y: y)
  }
  
  func increaseStrength(amount amount: Int) {
    strength += amount
  }
  
  func fireAtEnemy(enemy: Enemy)  {
    if inRange(position: self.position, range: self.range, target: enemy.position) {
      if enemy.health > 0 {
        print("enemy damaged!")
      } else {
        print("enemy already dead")
      }
    } else {
      print("enemy out of range")
    }
  }
  
  private func inRange(position position: Location, range: Int, target: Location) -> Bool {
    let availablePositions = position.surroundingPoints(range: range)
    for point in availablePositions {
      if point.x == target.x && point.y == target.y {
        return true
      }
    }
    return false
  }
}


///////////////////
// UNITS
///////////////////
class waterTower: Tower {
  override init(x:Int, y:Int) {
    super.init(x: x, y: y)
    self.strength = 2
    self.range = 2
  }
}

class fireTower: Tower {
  override init(x:Int, y:Int) {
    super.init(x: x, y: y)
    self.strength = 4
    self.range = 4
  }
}

class blueEnemy: Enemy {
  override init(x:Int, y:Int) {
    super.init(x: x, y: y)
    self.health = 4
  }
  
}

class orangeEnemy: Enemy {
  override init(x:Int, y:Int) {
    super.init(x: x, y: y)
    self.health = 8
  }
  
}



enum GameDifficulty:Int {
  case One, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
}

///////////////////
// GAME
///////////////////
class Game {
  let difficultyMultiplyer:Int = 2
  let board:Board
  private(set) var difficulty:Int = GameDifficulty.One.rawValue
  private(set) var enemyHealth:Int = 2
  private(set) var towerDamage:Int = 1
  
  init(width:Int, height:Int, difficulty:GameDifficulty) {
    self.board = Board(width: width, height: height)
    self.difficulty = difficulty.rawValue
  }
  
  func increaseDifficulty() {
    difficulty++
    enemyHealth *= difficultyMultiplyer
    towerDamage *= difficultyMultiplyer
  }
  
  
  func start() {
    
  }
  
  func addEnemy() {
    
  }
  
}


var game = Game(width: 3, height: 3, difficulty: .One)
