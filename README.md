# iOS-Swift-Fundamentals

**purpose** example some of the fundamentals of Swift.

**vision** use playgrounds to demostrate Swift fundamentals.

**methodology** coded in Swift playgrounds.

**status** working.

**notes** 
- terms
    - string interpolation print(“hello \(var)”)
    - Type Safety var string must be string
    - Type Inference let name : String = “bob"
    - operand 1
    - expression 1 + 1
    - operator +
    - assignment operator =
    - comparison operator == != > >= < <=
    - operator precedence PEMDAS
    - unary operators ++ — += -= ! -
    - binary operators + - / * %
    - ternary operators (true) ? true : false
    - logerical operators  && || (short circuit evaluation)
    - nil coalescing operator ??
    - collection [String]
    - value type Int, String, Double, Array, class
    - reference type class
    - primitive Int, String, Double, Float, Bool
    - object array, dictionary, class, struct, tuple
    - method overloading func bob(a: String) {} func bob(a: Int) {}
    - failable initializer init?() {}  // can return nil
    - control transfer statement break continue
    - loosely coupled vs tightly coupled don’t want objects heavily dependent each other
    - enum finite list of data
    - struct simple primate objects
    - class complicated objects (ex UIKit objects)
    - LLDB the debugger in xcode
    - decoupling objects which are loosely connected
    - grand central dispatch handling multithreading
    - designated initializers to have consistent initializations (can have multiple)

        - UIView.initWithCoder() xml debugger for nib
        - UIView.initWithFrame() x + y
    - lazy initialization deferring the alloc and init
    - redundancy normalization, dry
    - nonatomic not atomic which is multithreading thread safe
    - strong, weak, read-only, copy memory directive (when to increase reference count)
    - ARC automatic reference counting
    - overloading same function but different parameters
    - override take over the responsibilities of the parent function
- principles

    - DRY don’t repeat yourself
    - MVC model (create and manipulate data) view (display) controller (user interaction and ready to present data) design pattern
    - 4 P’s plan prepare perform perfect
    - Single Responsibility Principle protocols, classes, functions, views, controllers should be small
- design patterns

    - singleton a shared resource within a shared class (can and should be only 1)

        - multithread can sometimes dupe the single instance
        - SingleObject *s1 = [SingleObject sharedInstance];
        - +(SingleObject *) sharedInstance {static SingleObject *ourSharedInstance = nil; if (ourSharedInstance == nil) {static dispatch_once_t onceToken; dispatch_once(&onceToken, ^{ourSharedInstance = [[[self class] alloc] init]; }); } return ourSharedInstance; }
    - 2-stage object creation alloc (class memory allocation) and init (instance self)

        - Circle *a = [[Circle alloc] init];
        - -(instancetype) init { return [self initWithDiameter:3.0]; }
        - Circle *b = [[Circle alloc] initWithDiameter:2.0];
        - -(instancetype) initWithDiameter:(float)d { self = [super init]; if (self) { self.diameter = d; } return self; }
        - ColoredCircle *b = [ColoredCircle star];
        - +(ColoredCircle *) star { return [[ColoredCircle alloc] initWithDiameter:1.0 andColor:@“white”];}
    - KVC key value coding for .dotnotation of class properties

        - @property (nonatomic,strong) NSString *name;
        - [obj setValue:@“hello" forKey:@"name"];
        - NSLog(@“the string KVC value = %@", [obj valueForKey:@"name"]);
    - KVO key value observing watching property value changes (must know property)

        - NSKeyValueObservingOptions opts = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
        - [objA addObserver:objB forKeyPath:@"someValue" options:opts context:NULL];
        - objA.someValue = 15;
        - [objA removeObserver:objB forKeyPath:@"someValue"];
    - notification listeners for object communication (similar to pubsub)

        - [[NSNotificationCenter defaultCenter] postNotificationName:BLUE_NOTIF object:nil];
        - NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        - [obj addObserverForName:BLUE_NOTIF object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {}];
    - MVC model view controller to separate roles and responsibilities
- properties

    - define

        - var item: String
    - property getters and setters

        - var item: String { get {} set {} }
    - property observers

        - var item: String { didSet {} willSet {} }
- array // ordered list

    - var array = [String] = [“a”, “b”, “c”]
    - let add = array.append(“d”)
    - let add = array += [“e”]
    - let add = array.insert(“0”, atIndex: 1)
    - let read = array[0]
    - let update = array[1] = “B"
    - let remove = array.removeAtIndex(1)
    - let number = array.count
    - array[0..<n]
- dictionary // unordered key-value list

    - var dict [String: String] = [“a”: “A”, “b”: “B”]
    - let read = dict[“a”]
    - let read = dict[“c”] // returns an optional (arrays will crash)
    - let update = dict[“a”] = “AA"
    - let addUpdate = dict.updateValue(“BB” forKey: “b”) // adds if doesn’t exist
    - let remove = dict[“a”] = nil
    - let remove dict.removeValueForKey(“a”)
    - let number = dict.count
- loop

    - for name in array {}
    - for (key,val) in dict {}
    - for num in 1..<10 {} // [1,9]
    - for num in 1...10 {} // [1,10]
    - for var i = 0; i < 10; i++ {}
    - while true {}
    - repeat {} while true
- if else

    - if {} else if {} else if {} else {}
- switch  // must go through all cases [reason for default]

    - switch var { case 1,3,5:  “odd" break case 2,4,6: “even" break default: “none" }
    - default: is not required for enums
- function (encapsulates code to be reusable)

    - return

        - func calc(a a: Int, b: Int) -> Int { return }
    - no return type

        - func calc() {}
        - func calc() -> Void {}
        - func calc() -> () {}
    - named parameter

        - func calc(temp temperature: Int) {} // external & internal
    - modifiable parameters

        - func calc(var temp: Int) {}
    - default values

        - func calc(temp temperature: Int = 0) {}
    - returning complex values (using tuples)

        - func calc(temp: Int) -> (a: Int, b: Int) { return (1,2) }
    - functional scope
- tuple

    - let coordinate1: (x: Int, y: Int) = (0,0)
    - let output = coordinate1.x
- struct // custom datatype blueprint

    - stored properties

        - struct Point { let x: Int let y: Int }
    - method // functions inside a datatype

        - struct Point { func output() {}  }
    - initializer // not required as structs have auto init

        - struct Point { init(x: Int, y:Int) {self.x = x self.y = y } }
    - instance

        - let p1 = Point(x:1,y:2)
        - let output = p1.x
- classes

    - structs are value type while classes are reference types

        - structs create a new instance
        - classes reference each other
    - structs have optional auto init, classes do not
    - create

        - class Enemy {}
    - inheritance

        - class SuperEnemy: Enemy {}
        - override

            - override init(x,y,z) { self.z = z super.init(x: x, y: y) self.life = 50 }
        - subclass

            - “is a” question
    - compare

        - same instance item1 === item2
        - same class item1.dynamicType === item2.dynamicType
- enum

    - use to avoid var String misspellings
    - always use enum for modeling finite number of data
    - declare enum

        - enum Day { case Monday Case Tuesday }
        - var day = .Monday
    - enum raw value

        - are optionals
        - enum Day: Int { case Monday = 2, Tuesday = 4 }
        - var day = .Monday
        - var rawValue = day.rawValue // 2
        - var associatedValue = Day(rawValue: 2) // Monday
        - :Int auto increments, :String makes raw equal val
    - associated enum

        - enum Color { case RGB(r: CGFloat,g: CGFloat,b: CGFloat,a: Int) }
        - var color = .RGB(1,1,2,3)
    - enum methods

        - enum Color { func color() -> UIColor { return } }
        - var uiColor = Color.RGB(1,1,2,3).color()
    - pattern matching

        - for case .Quarter in wallet {}
        - if case .Nickle = coin || coin == .Nickle {}
    - switch statements

        - do not need default: for enums
        - reduce compiler exhaustiveness
- optionals

    - datatype or nil
    - var optionalVal: Int?
    - var forceUnwrap = optionalVal! (bad practice, never use)
    - optional binding

        - if let val = optionalVal { val } else { nil }
    - nested optional binding

        - if let val = optionalVal, let val2 = optionalVal { val, val2 }
    - optional chaining // val for nested optionals

        - let apt = person.residence?,address?.apartmentNumber {}
    - early exit // to get nil instead of val

        - guard let val = optionalVal else { nil  }
    - nil coalescing operator // ternary operator for nil

        - let middleName: String?
        - let firstName: String
        - let displayName = middleName ?? firstName
    - logical and operational condistionals

        - if let tracking = item.tracking?[i] where tracking == 1 {}
- protocols

    - the interface the blueprint of the methods

        - what should be implement, not how it’s implemented
        - used to enforce a design (prevents override errors and better encapsulations)
        - composition vs inheritance

            - for similar classes but different instances (like breeds)
            - that multiple (class, struct, enum) can satisfy a common constraint
            - “is a” = inheritance
            - “has a” = composition (protocol)
    - anything that uses the protocol (class, struct, enum) must meet protocol requirements
    - define

        - protocol UserType { var name: String { get set } }
    - implement

        - class RandomClass: Protocol1, Protocol2 {}
    - protocol as type

        - able to take in anything that conforms to the protocol

            - able to guarantee that each class, enum, struct has the property/method
        - protocol Blendable {}
        - func makeSmoothie(ingredients: [Blendable]) {}
    - protocol inheritance

        - can inherit from multiple protocols to build a larger rule base
        - protocol Printable { func desc() -> String }
        - protocol PrettyPrintable: Printable { func prettyDesc() -> String }
        - class User: PrettyPrintable { func desc() func prettyDesc() }
    - protocol best naming convention

        - can do = prefix with -able
        - is a = prefix with -type
        - can be = prefix with -convertible
    - protocol oriented programming

        - preferring compositions vs inheritance
        - able to be more DRY by grouping common properties/methods
        - class Enemy: PlayerType, Destructable, Attackable, Movable {}

            - immediate clear picture what an object can do
- error handling

    - types of errors

        - complier error prevents code from executing

            - domain error outside the range of acceptable uses (outputs nil
            - simple error halts execution
        - runtime error errors when running which crashes
    - throwing errors

        - enum myErrors: ErrorType { case InvalidData(String) }
        - func bob() throws -> String { throw myErrors.InvalidData(“username”) }
        - do { let steve = try bob() } catch myErrors.InvalidData { print(error) } catch { error }
    - swift vs obj-c

        - swift uses automatic propagation (grab in catch)
        - obj-c uses manual propagation (assigns NSError to parameter)
- defer

    - executes at the end of scope (function, etc)
    - can have multiple defer statements (run in opposite order)
    - defer { doThis() }
- delegate

    - delegate the work (tasks) to another class

        - it is a decorator pattern for better single responsibility

            - completely independent object from the original object
            - to avoid tight coupling of objects
            - to implement objet communication without strong relationships
            - to modify behavior and appearance without need to subclass
        - example

            - the touch delegate handles touches no matter what view
            - tableview delegate for extra features of cells height

                - delegates the work of cell modification elsewhere
                - optional features not required by tableview
            - textfield delegate to get extra features of didBeginEditing
    - declare

        - protocol TrackDelegate { func startTracking() }
        - class Tracker: TrackDelegate { func startTracking() { print(“start”) } }
    - instantiate (optional protocol property)

        - class Race { var delegate: RaceDelegate? }
    - use

        - class HorseRace: Race { func start() { delegate?.startTracking() } }
        - let race = HorseRace()
        - race.delegate = Tracker()
        - race.start()
- closure

    - able to pass functions around like data in your code
    - a combination of a function and an environment of captured variables

        - are stored as first class citizens (string, int, bool, etc)
        - are used to make higher order functions

            - able to have close variables (closure) within functions

                - similar to revealing modular design in javascript
                - they are stored to their enclosing reference (function)
    - uses

        - callbacks, delegates, completion blocks, reveling modular design
    - objc

        - called blocks
        - exampleBlock = ^{ NSLog(@“hello”); };
    - functions as variables (no parentheses)

        - func printString(str:String) { print(str) }
        - printString(“bob”)
        - let someFunction = printString
        - someFunction(“steve”)
    - functions as parameters

        - func displayString(innerFunc:(String) -> Void) { innerFunc(“bob”) }
        - displayString(printString)
    - functions as a return type (varables are retained [closed] within fn1)

        - func fn1() -> (Int) -> () { func fn2(n:Int) { print(n) } return fn2 }
        - let x = fn1
        - x(2)
- closure expressions (anonymous functions)

    - instead of passing a function, you pass in with brackets { }
    - example

        - let numbers = [1,2,3,4]
        - func doubler(i:Int) -> Int { return i * 2 }
        - let passFunction = numbers.map(doubler)
        - let passClosureExpression = numbers.map({ (i: Int) -> Int in return i * 2 })
        - let reverseClosure = names.sort({ (s1:String, s2:String) in return s1 > s2 })
    - shorthand

        - closure expression

            - let triple = { (i: Int) -> Int in return i * 3 }
            - [1,2,3,4].map(triple)
        - inline closure expression

            - [1,2,3,4].map({ (i: Int) -> Int in return i * 3 })
        - inferred type closure expression

            - [1,2,3,4].map({ i in return i * 3 })
        - implicit return if only 1

            - [1,2,3,4].map({ i in i * 3 })
        - shorthand argument names

            - [1,2,3,4].map({ $0 * 3 })
        - trailing closure

            - [1,2,3,4].map() { $0 * 3 }
        - ignore parentheses

            - [1,2,3,4].map{ $0 * 3 }
    - typealias

        - typealias JSONDictionaryCompletion = ([String:AnyObject?]) -> ()
        - func downloadJSONFromURL(completion: JSONDictionaryCompletion) {}
    - completion

        - func getBlogs(completion: (NSURLResponse! -> Void)) {

            - let download = session.downloadTaskWithRequest(request) {

                - (let url, let response, let error) in
                - completion(response) } }
        - getBlogs { (let response) in }
- debugging

    - p self
    - po self.frame
    - step (s)
    - next (n)
- memory management

    - manual memory management (dev remove)

        - memory leak

            - not deallocating memory after allocating
    - garage collection (trace)

        - reference counting

            - ARC (automatic reference counting)

                - pre-ARC

                    - maintain, release, autorelease to handle reference counting
                    - retain = strong
                    - dealloc method to release
                    - edit -> convert -> ObjC ARC
                - post-ARC (2011)

                    - reference counting handles themself
                    - ObjC ARC

                        - use weak references on blocks
                    - Swift ARC

                        - automatic memory directives (all strong)
                        - still need weak references for child to parent
                        - never nil should be unknown
                        - use capture lists on closures
    - tools

        - instruments

            - scheme -> profile -> build config = debug
            - product -> Profile (command i) -> Allocations

                - check Record Reference Counts
                - Record
        - debug navigator

            - visualize memory usage and download
- xcode

    - alt click on any variable to see type
    - command click any method to go to the header
