////////////////////////
// DELEGATE
////////////////////////
protocol RaceDelegate {
  // declare the rules
  func raceDidStart()
  func raceStatus(lapNumber: Int, first:AnyObject)
  func raceDidEnd(winner:AnyObject)
}


class Tracker: RaceDelegate {
  // impliment the protocol
  func raceDidStart() {
    print("START")
  }
  func raceStatus(lapNumber: Int, first:AnyObject) {
    
  }
  func raceDidEnd(winner:AnyObject) {
    
  }
}

class Race {
  // send the work of tracking to Tracking
  // use protocol property to link proto class
  
  var delegate: RaceDelegate?   // optional delegate
}

let r1 = Race()
// decide which class should handle the delegate
r1.delegate = Tracker()
r1.delegate?.raceDidStart()

