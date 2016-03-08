import Foundation



enum SkillLevel:Int {
  case One, Two, Three, Four, Five
}

enum HitType:Int {
  case Hit
  case Miss
  
  static var count: Int { return HitType.Miss.hashValue + 1}
}

class Player {
  var name: String
  var skillLevel:Int = SkillLevel.One.rawValue
  var games:[PingPong]
  var points:Int = 0
  
  init(name:String, skillLevel:SkillLevel) {
    self.name = name
    self.skillLevel = skillLevel.rawValue
    self.games = [PingPong]()
  }
}

class PingPong {
  var playerOne: Player
  var playerTwo: Player
  
  
  init(playerOne:Player, playerTwo:Player) {
    self.playerOne = playerOne
    self.playerTwo = playerTwo
  }
  
  func start() {
    playerOne.points = 0
    playerTwo.points = 0
    
    var hitter = decideStart() ? playerOne : playerTwo
    var winner: Player?
    
    while winner == nil {
      let hit = decideHit()
      let point = hit == .Hit ? 1 : 0
      hitter.points += point
      
      print("player: \(hitter.name) gets \(point) point with a \(hit)")
      
      hitter = hitter.name == playerOne.name ? playerTwo : playerOne
      winner = decideWinner()
    }
    
    print("winner: \(winner!.name) with a score of \(playerOne.points) to \(playerTwo.points)")
    
  }
  
  private func decideWinner() -> Player? {
    if playerOne.points >= 21 && playerOne.points + 2 >= playerTwo.points {
      return playerOne
    } else if playerTwo.points >= 21 && playerTwo.points + 2 >= playerOne.points {
      return playerTwo
    }
    return nil
  }
  
  private func decideStart() -> Bool {
    return Bool(Int(arc4random_uniform(2)))
  }
  
  private func decideHit() -> HitType {
    return HitType(rawValue: Int(arc4random_uniform(UInt32(HitType.count))))!
  }
}


let nate = Player(name: "nate", skillLevel: .One)
let kyle = Player(name: "kyle", skillLevel: .Two)

let game = PingPong(playerOne: nate, playerTwo: kyle)
game.start()
