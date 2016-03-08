////////////////////////
// THROWING ERRORS
////////////////////////


enum ParserError: ErrorType {
  case EmptyDictionary
  case InvalidKey
}

struct Parser {
  var data: [String : String?]?
  
  func parse() throws {
    guard let dict = data else {
      throw ParserError.EmptyDictionary
    }
    
    if !dict.keys.contains("someKey") {
      throw ParserError.InvalidKey
    }
  }
}

let data: [String : String?]? = ["someKey": nil]
let parser = Parser(data: data)
try parser.parse()
