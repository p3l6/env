Notes from https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html
Each note group loosely follows the pages in the guide.
==========

/* /* can nest comments */ */
float constants can be expressed 1.23e3
any numbers can have underscores in them, 1_000_000
indenting the closing """ will ignore whitespace at the beginning of every line for multi line strings

nil coalescing operator (a ?? b), uses b when a is nil
&& || are left-associative, && does not have precedence
Array has init(repeating:count:) instead of arrayWithCapacity:
Arithmetic operators do not overflow, causes error instead (can get c behavior with &+ &- or &*)
the standard operators can be defined for custom types. brand new operators can be declared globally with "operator"

for complex for loops, stride(from:through:by:)
do { try statement } catch { }
repeat-while is swift speak for do-while
switches do not fallthrough, unless explicitly requested. can still use break.
  multiple cases on a line with commas, can use ranges, can use where clause
label loops/switches to break a specific one
guard is like a reverse if statement for optionals. guard let x = optVar else {}, where thing is an optional, t is available to rest of scope, not the else block.

use tuples to return multiple values
function parameters can have default values, parameterWithDefault: Int = 12
variadic parameters are referenced inside the function in as an array of the appropriate type
parameters can be "inout", modifying the caller, called with &varName
functions can be nested

closure syntax: { arg1,arg2 in blah blah; return thing }
single expression closure can omit return keyword
argument list can be omitted in exchange for using $0, $1, $2, etc

a==b always means equivalent, don't need a.isEqualToString(b)
a===b  means a and b are the same instance, not just equivalent objects
structures are always passed by value, classes are passed by reference; otherwise they are very similar
String, Array, Dictionary are swift structures, ie they are always copied when assigned. (swift won't literally copy the memory until written to though)
functions in structs cannot modify self (since its a value type), unless marked mutating

can initialize properties on the line they are declared
properties can be marked lazy, they will not be initialized until used
computed properties have no storage, but do have accessors i.e. var center: Point {get {...return} set {newValue...}}
  also used to define a subscript(). can omit get/set keywords if get is all that is desired.
type properties are marked static, and are related to the type, not an instance. accessed from instance.var
type methods are also marked static. or marked class, which lets subclasses override. accessed from Type.method
to override properties or methods from a superclass, they must be marked "override"
overrides can be prevented by marking a property, method, or class as final
convenience init() is a method that will call another init() method in the same class. usually has simpler parameters
init() must call a superclass non-convenience init eventually
required init() means subclasses must override it
deinit {...} to handle code right before deallocation. ARC handles all memory, so it's just for other resources

no difference between Error and Exception. there is no Exception, Errors are thrown.
throw does not unwind the stack, and is comparable in performance to return.
try? will convert the error to an optional return
try! tells the compiler that a thrown error can't happen and should be ignored (will cause a crash if it does)
defer {} blocks will execute when the current scope is exited for any reason (including errors) ie: closing opened files

there is no global base class such as NSObject
use "is" and "as" for type casting, can use in a switch statement also.
you can nest types inside other types
extension is swift speak for category

protocols that inherit from AnyObject can only be applied to classes, not structures
you can require multiple protocols as a type, ie [ProtA & ProtB] is an array of objects that conform to both ProtA and ProtB
protocols can have optional methods, but can only be used on subclasses of NS-objc classes. This is not supposed to be used with swift, just an objc interoperability feature
protocol methods can have default implementations, which is what you need when you want optional methods

generics: use <T> after class or function name, T is a placeholder for any type. ie Array<T>
you can constrain the generic types, ie Dictionary<Key :Hashable, Value>

variables can be marked weak, but then must also be optional because it will become nil when the object is deallocated
alternatively, marked unowned, which will not be set to nil, but should be used when you are certain it will always have a value

the access levels are: open(subclass/override when imported as a module), public(can't subclass when imported),
  internal(to a module/framework/app/etc), fileprivate, private(to a class/scope/etc)
the default access level for everything is internal
use private(set) to change the access level for only a setter, leaving the getter public
