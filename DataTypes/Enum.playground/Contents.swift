import UIKit

////////////////////////
// ENUMS
////////////////////////

enum UIBarButtonStyle {
  case Done
  case Plain
  case Bordered
}

class UIBarButtonItem {
  
  var title: String?
  let style: UIBarButtonStyle
  var target: AnyObject?
  var action: Selector
  
  init(title: String?, style: UIBarButtonStyle, target: AnyObject?, action: Selector) {
    self.title = title
    self.style = style
    self.target = target
    self.action = action
  }
}

enum Button {
  // properties with assoiated values
  case Done(title: String)
  case Edit(title: String)
  
  func toUIBarButtonItem() -> UIBarButtonItem {
    // switch is best for enums since finite data
    switch self {
    case .Done(let title): return UIBarButtonItem(title: title, style: .Done, target: nil, action: nil)
    case .Edit(let title): return UIBarButtonItem(title: title, style: .Plain, target: nil, action: nil)
    }
  }
}


let doneButton = Button.Done(title: "Done").toUIBarButtonItem()
