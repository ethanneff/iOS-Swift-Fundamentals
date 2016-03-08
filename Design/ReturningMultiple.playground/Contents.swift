////////////////////
// RETURNING MULTIPLE (TUPLE)
////////////////////
func jediGreet(name name: String, ability: String) -> (farewell: String, mayTheForceBeWithYou: String) {
  return ("Good bye, \(name).", " May the \(ability) be with you.")
}

let retValue = jediGreet(name: "old friend", ability: "Force")
retValue
retValue.farewell
retValue.mayTheForceBeWithYou

func sum(x x: Int, y: Int) -> (Int,Int) { return (x + y,2) }