////////////////////////
// OPTIONALS
////////////////////////

struct Book {
  let title: String
  let author: String
  let price: String?
  let pubDate: String?
  
  init?(data: [String:String]) {
    // the opposite for getting nil first
    
    // if let x = data {}
    // guard let x = data else {}
    guard let title = data["title"], let author = data["author"] else {
      return nil
    }
    
    self.title = title
    self.author = author
    self.price = data["price"]
    self.pubDate = data["pubDate"]
  }
}

let b1 = Book(data: ["title":"123", "author":"aaaa", "price":"111"])
b1?.title
b1?.author
b1?.price
b1?.pubDate