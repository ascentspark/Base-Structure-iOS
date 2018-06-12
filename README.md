# Base-Structure-iOS
Basic structure for iOS projects

####DO's & DONT'S    

### 1. Naming Convention:
prioritizing clarity over brevity
using camel case 
using uppercase for Class, (and protocols), lowercase for everything else
including all needed words while omitting needless words
using names based on roles, not types
striving for fluent usage
using terms that don't surprise experts or confuse beginners

###2. Memory Management
Code (even non-production, tutorial demo code) should not create reference cycles. Analyze your object graph and prevent strong cycles with weak and unowned references.

Extending object lifetime

Extend object lifetime using the [weak self] and guard let strongSelf = self else { return } idiom. [weak self] is preferred to [unowned self] where it is not immediately obvious that self outlives the closure. Explicitly extending lifetime is preferred to optional unwrapping.

Preferred

resource.request().onComplete { [weak self] response in
guard let strongSelf = self else {
return
}
let model = strongSelf.updateModel(response)
strongSelf.tableView.reloadData()
}
Not Preferred

// might crash if self is released before response returns
resource.request().onComplete { [unowned self] response in
let model = self.updateModel(response)
strongSelf.tableView.reloadData()
}
Not Preferred

// deallocate could happen between updating the model and updating UI
resource.request().onComplete { [weak self] response in
let model = self?.updateModel(response)
strongSelf.tableView.reloadData()
}

###3. Semicolons

Swift does not require a semicolon after each statement in your code. They are only required if you wish to combine multiple statements on a single line.

Do not write multiple statements on a single line separated with semicolons, use it only during multiple statements.

Preferred:

let swift = "not a scripting language"

Not Preferred:

let swift = "not a scripting language";

###4. Protocol Conformance

In particular, when adding protocol conformance to a model, prefer adding a separate extension for the protocol methods. This keeps the related methods grouped together with the protocol and can simplify instructions to add a protocol to a class with its associated methods.

Preferred:

class ViewController: UIViewController {
// class stuff here
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
// table view data source methods
}

// MARK: - UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
// scroll view delegate methods
}

Not Preferred:

class MyViewController: UIViewController, UITableViewDataSource, UIScrollViewDelegate {
// all methods
}

###5. Constants

Always put all basic constants in a single file which might contain basic info of Colours, API's, etc. Check the Constants.swift file for more.

###6. Code Organization

Always use //MARK: to comment and keep things organized

###7. Segues

Usage of segue is not acceptable untill and unless there's a typical need.

Preferred:

Use NavigationController in your ViewController class to navigate, instead of StoryBoard Segues.

###8. Model Classes

Creation of Model Classes using ObjectMapper is essential for all API calls.

###9. API Calls

All API calls to be made using Almofire(preferred), NSSession only for simple projects

###10. Constraints

Use of constraints is a must to support all device types.

Preferred:

Using AspectRatio, leading, trailing.

Not Preferred:

Using fixed width & height untill and unless it is required(based on design circumstances)

###11. Closure

Ask for guidance before wiriting a closure.

###12. Copy & Paste

Do not copy and paste functions and code verbatim from one class to another class.

###13. Global Variable or function

Do not try to declare a variable or write a function globally, use Singleton pattern instead.

###14. Protocol

Always use protocol to create an abstraction layer when coding similar functionalities.
example:- Payment Gateway from different companies

