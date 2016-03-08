import UIKit
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
