////////////////////
// SINGLETON
////////////////////
class Myclass {
  static let sharedInstance = Myclass()
  var title = "steve"
  internal let cupid = "private"
  
  private func output() -> String {
    return cupid
  }
  private init() {}
}

Myclass()
var jill = Myclass.sharedInstance
var bob = Myclass.sharedInstance
Myclass.sharedInstance.title
jill.title = "a"
Myclass.sharedInstance.title
bob.title = "b"
Myclass.sharedInstance.title
jill.title
bob.title

bob.output()
bob.cupid
bob.cupid



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



////////////////////
// RETURNING MULTIPLE
////////////////////
func jediGreet(name name: String, ability: String) -> (farewell: String, mayTheForceBeWithYou: String) {
  return ("Good bye, \(name).", " May the \(ability) be with you.")
}

let retValue = jediGreet(name: "old friend", ability: "Force")
retValue
retValue.farewell
retValue.mayTheForceBeWithYou

func sum(x x: Int, y: Int) -> (Int,Int) { return (x + y,2) }


////////////////////
// COMPLETION BLOCK
////////////////////
func hardProcessingWithString(input: String, completion: (result: String) -> Void) {
  print("bob")
  let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 4 * Int64(NSEC_PER_SEC))
  dispatch_after(time, dispatch_get_main_queue()) {
    completion(result: "we finished!")
  }
}

hardProcessingWithString("commands") {
  (result: String) in
  let bob = 123
  print(result)
}
