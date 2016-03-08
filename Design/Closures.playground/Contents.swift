
//////////////////////////////
// function as a variable
//////////////////////////////
func printString(str:String) {
  print("printing the string: \(str)")
}

printString("bob")
let someStringFunction = printString
someStringFunction("aodinasod")



//////////////////////////////
// function as a parameter
//////////////////////////////
func displayString(printStringFunc:(String) -> Void) {
  printStringFunc("I'm a function inside another function")
}

displayString(printString)



//////////////////////////////
// function as a return type
//////////////////////////////
func printerFunction() -> (Int) -> () {
  var runningTotal = 0
  
  func printInteger(number:Int) {
    runningTotal += 10
    print("The integer passed is: \(number) and the running total is: \(runningTotal)")
  }
  return printInteger
}

let printAndReturnIntegerFunc = printerFunction()
printAndReturnIntegerFunc(3)
printAndReturnIntegerFunc(2)
let runningTotal = printerFunction()
runningTotal(2)



func differenceBetweenNumbers(a: Int, b:Int) -> (Int) {
  return a - b
}

func mathOperation(mathOp: (Int, Int) -> Int, a: Int, b: Int) -> Int {
  return mathOp(a, b)
}

let difference = mathOperation(differenceBetweenNumbers, a: 10, b: 3)



//////////////////////////////
// closure expression
//////////////////////////////
let numbers = [1,2,3,4,9,2,5,1,2,4]

func doubler(i:Int) -> Int {
  return i * 2
}

numbers.map(doubler)
numbers.map({ (i: Int) -> Int in return i * 3 })

let names = ["asdas","wqasd","asdasd", "asdion"]
func backwards(s1:String, s2:String) -> Bool {
  return s1 > s2
}

names.sort(backwards)
let sorted = names.sort({ (s1:String, s2:String) in return s1 > s2 })
sorted


//////////////////////////////
// closure shorthand
//////////////////////////////
let tripleFunc = { (i: Int) -> Int in return i * 3 }
[1,2,3,4].map(tripleFunc)

// inline closure expression
[1,2,3,4].map({ (i: Int) -> Int in return i * 3 })

// inferred type closure expression
[1,2,3,4].map({ i in return i * 3 })

// implicity return if only 1
[1,2,3,4].map({ i in i * 3 })

// shorthand argument names
[1,2,3,4].map({ $0 * 3 })

// trailing closure
[1,2,3,4].map() { $0 * 3 }

// ignore parentheses
[1,2,3,4].map{ $0 * 3 }
  
  
  
//////////////////////////////
// typealias
//////////////////////////////
typealias JSONDictionaryCompletion = ([String:AnyObject?]) -> ()

func downloadJSONFromURL(completion: JSONDictionaryCompletion) {
  
}