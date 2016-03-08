# iOS-Swift-Fundamentals

# iOS-ObjC-Design-Pattern-Examples

**purpose** example some of the fundamentals of Swift.

**vision** demostrate Swift.
**methodology** coded in Objective-C.

**status** working.

**notes** 
- **singleton** a shared resource within a shared class (can and should be only 1)

    - multithread can sometimes dupe the single instance
    - SingleObject *s1 = [SingleObject sharedInstance];
    - +(SingleObject *) sharedInstance {static SingleObject *ourSharedInstance = nil; if (ourSharedInstance == nil) {static dispatch_once_t onceToken; dispatch_once(&onceToken, ^{ourSharedInstance = [[[self class] alloc] init]; }); } return ourSharedInstance; }
- **2-stage object creation** alloc (class memory allocation) and init (instance self)

    - Circle *a = [[Circle alloc] init];
    - -(instancetype) init { return [self initWithDiameter:3.0]; }
    - Circle *b = [[Circle alloc] initWithDiameter:2.0];
    - -(instancetype) initWithDiameter:(float)d { self = [super init]; if (self) { self.diameter = d; } return self; }
    - ColoredCircle *b = [ColoredCircle star];
    - +(ColoredCircle *) star { return [[ColoredCircle alloc] initWithDiameter:1.0 andColor:@“white”];}
- **KVC** key value coding for .dotnotation of class properties

    - @property (nonatomic,strong) NSString *name;
    - [obj setValue:@“hello" forKey:@"name"];
    - NSLog(@“the string KVC value = %@", [obj valueForKey:@"name"]);
- **KVO** key value observing watching property value changes (must know property)

    - NSKeyValueObservingOptions opts = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    - [objA addObserver:objB forKeyPath:@"someValue" options:opts context:NULL];
    - objA.someValue = 15;
    - [objA removeObserver:objB forKeyPath:@"someValue"];
- **Notification** listeners for object communication (similar to pubsub)

    - [[NSNotificationCenter defaultCenter] postNotificationName:BLUE_NOTIF object:nil];
    - NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    - [obj addObserverForName:BLUE_NOTIF object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {}];
- **MVC** model view controller to separate roles and responsitiblies
