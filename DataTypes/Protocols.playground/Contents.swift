////////////////////
// PROTOCOLS
////////////////////

// example 1
protocol FullyNameable {
  var fullName: String { get }
}

struct User: FullyNameable {
  var fullName: String
}

let user = User(fullName: "John Smith")

struct Friend: FullyNameable {
  let firstName: String
  let middleName: String
  let lastName: String
  
  var fullName: String {
    return "\(firstName) \(middleName) \(lastName)"
  }
}

let friend = Friend(firstName: "Taylor", middleName: "Alison", lastName: "Swift")
friend.fullName

// example 2
protocol Blendable {
  func blend()
}

class Fruit: Blendable {
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  func blend() {
    print("I'm mush")
  }
}

class Dairy {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

class Cheese: Dairy {}

class Milk: Dairy, Blendable {
  func blend() {
    print("I haven't changed. I'm still milk")
  }
}

func makeSmoothie(ingredients: [Blendable]) {
  for ingredient in ingredients {
    ingredient.blend()
  }
}

let strawberry = Fruit(name: "Strawberry")
let cheddar = Cheese(name: "Cheddar")
let chocolateMilk = Milk(name: "Chocolate")

let ingredients: [Blendable] = [strawberry, chocolateMilk]

makeSmoothie(ingredients)