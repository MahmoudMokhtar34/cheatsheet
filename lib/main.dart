import 'dart:async';

import 'package:cheatsheet/myLibrary.dart';
//Dart cheatsheet

//int topLevelVar; //error top level variables should be initialized
// top-level function where app execution starts
void main() {
  String me = "hi ";
  print(me.runes);

//Variables, Data Types, & Comments
//Use var with type inference or instead use type name directly
//uninitialized var inferred dynamic so take care of this and write type for uninitialized var
  var unInitializedVariable; //dynamic data type
  unInitializedVariable = null; //no error (dynamic can be null)
  unInitializedVariable = 'hi'; //no error dynamic can contain string
  unInitializedVariable = 1; //no error dynamic can contain integer
  print('uninitialized var type is ${unInitializedVariable.runtimeType}');

//initialized var dart will infer its type
  var initializedVariable = 1; //int data type
  //initializedVariable = null; //error int can't be null)
  //initializedVariable = 'hi'; //error int can't change to String

  var myAge = 35; // inferred int created with var
  var pi = 3.14; // inferred double created with var
  int yourAge = 27; // type name instead of var
  double e = 2.718; // type name instead of var
// This is a comment
  print(myAge); // This is also a comment.
/*multi line comment*/
// dynamic can have value of any type including null
  dynamic numberOfKittens = 0;
// dynamic String
  numberOfKittens = 'There are no kittens!';
  numberOfKittens = 0; // dynamic int
  numberOfKittens = 1.0; // dynamic double
  bool areThereKittens = true; // bool
// Compile-time constants
  const speedOfLight = 299792458;
// Immutables with final (run time constant)
  final planet = 'Jupiter';

  String? earth;
  earth = "earth";

  print(earth.runtimeType);
// planet = 'Mars'; // error: planet is immutable

//Null safety
  int age; //can be declared but must be initialized later or will cause compile time error
  age = 1; //initialiization

  //or declare it as nullable type by adding ? to the type keyword
  int? iCanBeNull; //can be null

  // Null-checking
  //print(iCanBeNull.isEven); //will cause compile time error
  //if you are aware of the consequences and will handle it or assign it a value or for
  //assertion operator(I know what I'm doing & I'm sure it will n't be null & I'm testing my code to avoid null values)
  //print(iCanBeNull!.isEven); //skips compiler null checking & will cause run time error (exception) if it is null
  print(iCanBeNull
      ?.isEven); //conditional check if null will not execute operations on it & will return null
  //bool nonNull = iCanBeNull?.isEven; //will cause error (assigning nullable to non null variable)

  print(iCanBeNull ?? "it is null"); //if it is null take the right value
  int imNotNull =
      iCanBeNull ?? 1; //another example (if it is null take the right value)
  //same as
  imNotNull = iCanBeNull == null ? 1 : iCanBeNull;
  print(imNotNull);
  dynamic nullDynamic;
  print(nullDynamic); //dynamic can be null

  //example combined ?. + ??
  var mayNull;
  int mayNullLength = mayNull?.length ?? 0;
  // ??= means if the left is null assign it to the right and if not null ignore
  print('mayNull value is $mayNull'); //mayNull == null
  print(
      'mayNull value is ${mayNull ??= 100}'); //mayNull == null & assignment will execute
  print(
      'mayNull value is ${mayNull ??= 200}'); //mayNull became == 100 & assignment will not execute

  ///static applied see {line 94}
  StaticMembers myObject = StaticMembers();
  //static fields can be accessed by the class itself but not its objects
  StaticMembers.c = 0;
  StaticMembers.staticMethod();
  //myNumber.c; //error
  // myObject.staticMethod; //error

  ///private applied see {myLibrary.dart}
  //only public fields and methods can be accessed from outer libraries
  OuterLibClass here = OuterLibClass();
  here.publicField;
  here.publicMethod();

  //Operators
// Arithmetic
  40 + 2; // 42 40 IS LEFT OPERAND AND 2 IS RIGHT OPERAND
  44 - 2; // 42
  21 * 2; // 42
  84 / 2; // 42
  84.5 ~/ 2.0; // int value 42 (TRUNCATE DECIMALS)
  392 % 50; // 42 REMAINDER OF DIVISION
// Types can be implicitly converted
  var answer = 84.0 / 2; // int 2 to double
// Equality and Inequality
  42 == 43; // false
  42 != 43; // true
// Increment and decrement
  print(answer++); // 42, since it prints first for
//postfix
  print(--answer); // 42, since it decrements first
//for prefix
// Comparison
  42 < 43; // true
  42 > 43; // false
  42 <= 43; // true
  42 >= 43; // false
// Compound assignment
  answer += 1; // 43
  answer -= 1; // 42
  answer *= 2; // 84
  answer /= 2; // 42
  int a = 1, b;
// Increment
  b = ++a; // preIncrement - Increment a before b gets its value.
  b = a++; // postIncrement - Increment a AFTER b gets its value.

//Decrement
  b = --a; // predecrement - Decrement a before b gets its value.
  b = a--; // postdecrement - Decrement a AFTER b gets its value.

// Logical
  (41 < answer) && (answer < 43); // true
  (41 < answer) || (answer > 43); // true
  !(41 < answer); // false

//Strings
// Can use single or double quotes for String type
  var firstName = 'Albert';
  String lastName = "Einstein";
// Embed variables in Strings with $
  var physicist = "$firstName $lastName";
// Albert Einstein
// Escape sequences such as \' and \n
// and concatenating adjacent strings
  var quote = 'If you can\'t'
      ' explain it simply\n'
      "you don't understand it well enough.";
// Concatenation with +
  var energy = "Mass" + " times " + "c squared";
// Preserving formatting with """
  var model = """
I'm not creating the universe.
I'm creating a model of the universe,
which may or may not be true.""";
// Raw string with r prefix
  var rawString = r"I'll\nbe\nback!";
// prints I’ll\nbe\nback!

//Control Flow: Conditionals
  var animal = 'fox';
  if (animal == 'cat' || animal == 'dog') {
    print('Animal is a house pet.');
  } else if (animal == 'rhino') {
    print('That\'s a big animal.');
  } else {
    print('Animal is NOT a house pet.');
  }
//short if
  print(animal == 'cat' ? 'animal is cat' : 'animal is not a cat');
// switch statement used for equality comparison only not > < or >=  <=
//swich when used for enums will check for unused enumerators
  Semester semester;
  switch (month) {
    case Month.august: //commenting it will cause a warning for missed case
    case Month.september:
    case Month.october:
    case Month.november:
    case Month.december:
      semester = Semester.fall;
      break;
    case Month.january:
    case Month.february:
    case Month.march:
    case Month.april:
    case Month.may:
      semester = Semester.spring;
      break;
    case Month.june:
    case Month.july:
      semester = Semester.summer;
      break;
  }

//Control Flow: While loops
  var i = 1;
// while, print 1 to 9
  while (i < 10) {
    print(i);
    i++;
  }
// do while, print 1 to 9
  i = 1;
  do {
    print(i);
    ++i;
  } while (i < 10);
// break at 5
  do {
    print(i);
    if (i == 5) {
      break;
    }
    ++i;
  } while (i < 10);
//Control Flow: For loops
  var sum = 0;
// Init; condition; action for loop
  for (var i = 1; i <= 10; i++) {
    sum += i;
  }
// for-in loop for list
  var nums = [1, 2, 3, 4, 5, 6, 7];
  for (var number in nums) {
    print(number);
  }
// Skip 3 with continue and exit loop with break
  for (var number in nums) {
    if (number == 3) {
      continue;
    }
    if (number == 5) {
      break;
    }

    print(" --- $number --- ");
  }
// forEach with function argument
  nums.forEach(print); // 1, 2, 3, 4 on separate lines
// forEach with anonymous function argument
  nums = [13, 14, 15, 16];
  nums.forEach((number) => print(number.toRadixString(16)));

// d, e, f, 10

//Functions
//Named function with required parameters
  bool isBanana(String fruit) {
    return fruit == 'banana';
  }

  var fruit = 'apple';
  //this is calling the function (execution)
  //and the passed values or variables are called arguments
  isBanana(fruit); // false
  isBanana('banana');

// Optional parameters with square brackets [like a list of optional positional parameters]
//void func([int error]){}; //null safety error either int? or set default a value or make it required
  void fullName(String first, String last, [String title = ""]) {
    print("$title  $first $last".trimLeft());
  }

  fullName("Ray", "Wenderlich"); // Ray Wenderlich
  fullName("Albert", "Einstein", "Professor"); //Professor Albert Einstein

// Optional named parameters with braces {like a map of named parameters}
  bool withinTolerance(int value, {int? min, int? max}) {
    return (min ?? 0) <= value && value <= (max ?? 10);
  }

  withinTolerance(11, max: 10, min: 1); // false

// named optional with Default values & named required {like a map of named parameters with values}
  bool withinTolerance2(int value,
      {int min = 0, int max = 10, required int req}) {
    return min <= value && value <= max;
  }

  withinTolerance2(5, req: 5); // true
// Function as parameter
  int applyTo(int input, int Function(int) doThis) {
    return doThis(input);
  }

//use of anonymous function
  int result = applyTo(5, (x) => x * 600000);
  print('=============> $result');

  // Function as a return type
  int Function(int) returnFunc(int value) {
    return (v) => value * 3;
  }

  int square(int n) {
    return n * n;
  }

  applyTo(3, square); // 9

// Arrow syntax for one line functions
  int multiply(int a, int b) => a * b;
  multiply(14, 3); // 42

// Anonymous functions (without a name)
// Assign anonymous function to a variable
  var multiply2 = (int a, int b) {
    return a * b;
  };
// Call a function variable
  multiply2(14, 3); // 42

//generic function (work on any data type)
  A genericFunc<A, T>(A x, T y, A Function(A, T) applyTo) {
    return applyTo(x, y);
  }

  var m = genericFunc(
      'hi',
      2,
      (p0, p1) =>
          p0 *
          p1); //n.b to multiply string make the string first operand not vice versa
  print('***********>>> $m');

// Closures
//TODO closures
  Function applyMultiplier(num multiplier) {
    // Return value has access to multiplier
    return (num value) => value * multiplier;
  }

  var triple = applyMultiplier(3);
  triple(14.0); // 42.0

//Collections: Lists
// Fixed-size list
//var pastries = List<String>(3); //null safety error
  var listOfDynamics = [];
  final listOfDynamics2 = [];

  List<int> listOfIntegers = [];
  var listOfIntegers1 = <int>[];
  var listOfIntegers2 = [1, 2];
  final listOfIntegers3 = [1, 2];

  final finalList = [1, 'hi']; //can't reassign but modifiable
  //finalList = [2,'k']; //ct error
  finalList[0] = 2; //allowed
  finalList.add(3);

  const constList = [1, 'hi']; //can't reassign and not modifiable
  //constList = [2,'k']; //ct error
  //constList.add(2); //exception in run time
  //constList[0] = 2; //exception in run time

  var pastries = <String>[];
  print(" =========>> $finalList");
// Element access by index
  pastries.add('142');
  pastries[0] = 'cookies';
  // pastries[1] = 'cupcakes';
  // pastries[2] = 'donuts';
// Growable list
  List<String> desserts = [];
  desserts.add('cookies');
// Initialize by growable list
  desserts = ['cookies', 'cupcakes', 'pie'];
// List properties and methods
  desserts.length; // 3
  desserts.first; // 'cookies'
  desserts.last; // 'pie'
  desserts.isEmpty; // false
  desserts.isNotEmpty; // true
  desserts.firstWhere((str) => str.length < 4);
// pie
// Collection if
  var peanutAllergy = true;
  var candy = [
    'junior mints',
    'twizzlers',
    if (!peanutAllergy) 'reeses',
  ];
// Collection for
  var numbers = [1, 2, 3];
  var doubledNumbers = [for (var number in numbers) 2 * number];
// [2, 4, 6]

//Collections: List Operations
// Spread Operator
  pastries = ['cookies', 'cupcakes'];
  desserts = ['donuts', ...pastries, ...candy];
//copying a collection
  var collection1 = [10, 20, 30];
  var collection2 =
      collection1; //assigned an new pointer to the same list and not copied
  collection2[0] = 1; //change value for both lists
  print(collection1);
  print('=======');
  print(collection2);
  //to actually copy it
  var collection3 = [...collection1];
  collection3[0] = 5;
  print('*********');
  print(collection1);
  print('======== ');
  print(collection3);

// Map to transform list
  numbers = [1, 2, 3, 4];
  //foreach used for executing something on the list items and return nothing
  //accepts void functions only
  numbers.forEach((number) {
    print(number++);
  });
  print(numbers); //numbers stay the same
  //map used for executing something on the list items and return a new
  //lazy iterable (executes when needed only)
  var squares = numbers.map((number) {
    return number * number;
  }); //map will not execute here because it is lazy (not needed)
  print('========>>>>> squares $squares'); //map will be executed here(needed)
// [1, 4, 9, 16]
// Filter list using where
  var evens = squares.where((square) => square.isEven); // (4, 16)
// Reduce list to combined value
  var amounts = [199, 299, 299, 199, 499];
  var total = amounts.reduce((value, element) => value + element); // 1495

  //Collections: Sets (contain unordered unique elements)
// Create set of int
  var someSet = <int>{};
// Set type inference
  var anotherSet = {1, 2, 3};
  print('======> anotherSet $anotherSet');
//access element
  int element0 = anotherSet.elementAt(1);
  print('==============> element0 = $element0');
// Check for element
  anotherSet.contains(1); // true
  anotherSet.contains(99); // false
// Adding and removing elements
  someSet.add(42);
  someSet.add(2112);
  someSet.remove(2112);
// Add to set from list
  someSet.addAll([1, 2, 3, 4]);
// Intersection
  var intersection = someSet.intersection(anotherSet);
// Union
  var union = someSet.union(anotherSet);
// difference
  var difference = someSet.difference(anotherSet);

  //Collections: Maps
  //best use for parsing json and best type is <String , dynamic>
// Map from key String & int values
  var emptyMap = <String, int>{};
// Map from String to String
  var avengers = {
    //mixed value types map with no types will infer <String , Object>
    "Iron Man": "Suit",
    "Captain America": "Shield",
    "Thor": "Hammer",
    'number': 1,
  };
  //object data type of the value
  var value = avengers['Iron Man']; //as String or .toString() to make it string
  //var length = value.length; //error .length can't be done on Object data type
  //print('========================> length $length');
  //element that don't exist
  var notExist = avengers['batman']; //null so check for null
  print('===========> $notExist');
// Element access by key
  var ironManPower = avengers["Iron Man"]; // Suit
  avengers.containsKey("Captain America"); // true
  //search in values only
  avengers.containsValue("Arrows"); // false

// Access all keys and values
  avengers.keys.forEach(print); // Iron Man, Captain America, Thor
  avengers.values.forEach(print); // Suit, Shield, Hammer
// Loop over key-value pairs
  avengers.forEach((key, value) => print('$key -> $value'));
  //for loop in maps
  for (var key in avengers.keys) {
    print(key);
  }
  for (var val in avengers.values) {
    print(val);
  }
  for (var entry in avengers.entries) {
    print('${entry.key} : ${entry.value}');
  }

//TODO callback function and _ replacement
/*Callback: is basically a function or a method that we pass as an argument into
    another function or a method to perform an action
    i.e. we make a function A that accepts a function B as one of its parameters
    to be executed when A is called.
    and the function B that we pass as an argument when we call A is the 
    callback function that will be executed during A execution

    N.B. if the call back method require parameters it should be provided in the
    parameters of the calling function A

    N.B when you call the A function you will provide the definition for 
      the B method and what it will do (you are not calling (executing) it in 
      the argument section you are just defining it) so that the calling of B 
      (execution) step occur while A executes as A definition determines.
    
    N>B you can add a function call that accepts parameters  to be executed 
      within the body of the callback function B
 */
  void functionA(
    int i, //parameter to be used in function A
    int x, //parameter to be used in function B
    String abc, //parameter to be used in function B
    void Function(int, String) callbackFunctionB,
  ) {
    i++; //this is what A function do
    //this is what you will make function A do for you using B
    callbackFunctionB(x, abc);
  }

  void callMeAndAnotherThing(int a, void Function() doAnotherThing) {
    a++;
    doAnotherThing();
  }

//TODO Implementation area
//Cascade operator
//   Two two = Two()
//     ..concMethod()
//     ..absMethod();
//TODO move to method def to main to test __ _
//using a call back function and providing the function definition for it
  functionA(0, 1, 'abc',
      //callback function definition
      //n & m are call back func parameters(int n, String m)
      //(not arguments (values))
      (n, m) {
    //and this is the callback function body
    //(definition) not its call (execution)
    n++;
    m += ' hi';
    print(r"///////////*********\\\\\\\\\");
    print('$n + $m');
    //you can add other functions here to be executed also
  });
//using _ for unused parameter in call back functions
//1st parameter use _ 2nd __ 3rd ___ etc...
  functionA(1, 2, 'abc', (_, __) {
    print('no parameters used here');
  });

//closures applied
  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);

  //callable class
  var caller = Callable(0);
  caller
    ..xPlus1()
    ..xPlus1();
  //calling the object as a function executes the call function in its class
  print('-------- ${caller(5)} ---------');

//scope for duplicate identifier name in nested function parameters
//explains different context (parameter identifier) scope in flutter widgets
//i.e context when used in methods and constructors inside flutter widgets
//parameters it is used just as as an identifier for the parameters not as
// a context value
  void func1({int i = 1}) {
    // i is the identifier for func1
    i = 2; // //changes value of i in func1
    void func2({int i = 13}) {
      //i became the identifier for func 2 inside it only
      i = 15; //changes value of i in func2 only
      print(i); //prints value of i in func2 only
    }

    i = 3; //changes value of i in func1 only
    func2(); //call func2
    print(i); //prints value of i in func1
  }

  func1(); //15 , 13 (i func2 ,i func1)

  var list = [1, 2, 3];
  void plusOne(int i) => ++i;
  List list2 = list.map(plusOne).toList();
  print("@@@@@@@@@@@@@@ $list2");

  //Callable class calling in 3 different ways
  Callable(0)(2); //1
  var callObject = Callable(1);
  callObject.call(2); //2
  callObject(3); //3
}

//closures
/// Returns a function that adds [addBy] to the
/// function's argument.

Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

Function makeMultiplier(int multiBy) {
  return (int x) {
    return x * multiBy;
  };
}

//TODO closure: a function object that has access to variables in its lexical
//scope, even when the function is used outside of its original scope.
Function returnClosure() {
  //variable that can't be accessed outside here (it should be destroyed after
  //finishing this outer function and can't be used from outside here)
  String innerVar = "inner variable value";
  //function that holds reference to the innerVar
  String getInnerVar() {
    return innerVar;
  }

  //return the function (closure) that holds access (closes over them) to the
  // inner variables and uses them outside their original scope
  return getInnerVar;
}

//callable class using call method (keyword)
//functions also have a default call method in it funName() same as
//funName.call()
class Callable {
  int x;
  Callable(this.x);
  int xPlus1() => x++;
  call(int y) {
    //called function when we use the object as a function "objectName()"
    // or className()()  i.e constructor
    print('========  ${x * y}  ===========');
    return x;
  }
}

//https://www.tutorialspoint.com/dart_programming/dart_programming_typedef.htm
typedef IntFunction = int Function(int);
int Function(int) func(int x) {
  return (x) => x * 5;
}

// OR replace with the typedef name
IntFunction func2(int x) {
  return (x) => x * 5;
}

//static in class see line 79
class StaticMembers {
  static int c = 0; //static field (called via class name only)
  static int _c =
      0; //static (called via class name only) & private (for this library only)
  static void staticMethod() => print('static Method');
  static void _staticMethod() => print('static & private Method');
}

//null safety in classes
class NullSafetyClass {
  //PREFER specifying a type annotation for uninitialized variables and fields.
  var dynamicX; //not good (type is dynamic & will accept any type at any time)
  //y = 1; //error initialization must be in-line
  int uninitializedX; //error (initialize in-line or make a constructor or late or [make it null type by ?])
  int initializedX = 0;
  late int lateX;
  int? mayBeNullX;

  //if no constructors available will get error because default constructor will not get a value for uninitializedX

  NullSafetyClass(
      this.uninitializedX); //we make a constructor with value required for uninitializedX
  //NullSafetyClass.named1(); //error uninitializedX must be initialized in all constructor
  NullSafetyClass.named2()
      : uninitializedX = 1; //named constructor with initialization
  NullSafetyClass.named3(
      this.uninitializedX); //named with value required for uninitializedX
}
// WINDOS PASS NF6HC-QH89W-F8WYV-WWXV4-WFG6P

// Enumerations used as descriptive constatnts especially for options
//e.g. gender(male,female)
enum Gender {
  male,
  female, //comma at the end makes it formatted into multi line
}

enum Gender2 { male, female }

enum Month {
  january,
  february,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  october,
  november,
  december
}

final month = Month.august;

enum Semester { fall, spring, summer }

//Classes and Objects
class House {
  //public field or property
  int nrOfWalls;
  //private field (property) (member)
  String _wallType;
  //static fields (belongs to the class itself & not belong to its objects)
  //called using the class name only & not accessible by its objects
  static int nrOfObjectsCreated = 0;
  //the : is used for initialization and called initializer
  // i.e Constructor with initializer list
  House(int nw, String wt)
      : nrOfWalls = nw, //initializer list start
        _wallType = wt {
    //constructor body start
    nrOfObjectsCreated++; //NUMBER OF OBJECTS CREATED COUNTER
  }

  //named constructor
  House.brickHouse4Walls()
      : nrOfWalls = 4,
        _wallType = "brick" {
    nrOfObjectsCreated++; //NUMBER OF OBJECTS CREATED COUNTER
  }
  //short form constructor
  House.shortConstructor(this._wallType, this.nrOfWalls) {
    nrOfObjectsCreated++;
  }
  //calling the main constructor within another named one
  House.caller() : this(10, 'wood');
  //calling another named constructor in another named one
  House.anotherCaller() : this.brickHouse4Walls();

  //getter for private property
  String get wallType => _wallType;
  //setter for private property
  //N.B if we used both setter an getter with no modification to the bodies
  //or name of methods it will be the same as public fields and will cause warning
  //set wallType(String wt) => _wallType = wt; //cause warning
  set typeOfWall(String wt) => _wallType = wt; //different name
  set wallType(String wt) => _wallType = "type is $wt"; //modification in  body

  // Override from Object (Object is the parent of all classes and types)
  @override
  String toString() => "nr of walls $nrOfWalls of $_wallType";
}

//e.g. for use of static fields class for my app strings & frequently used methods
//accessed by MyStrings.appName  ...etc like enum
class MyStrings {
  static String appName = "hello world";
  static String firstPage = "Log in";
  static String secondPage = "Notes";
  static String logInMessage = "please log in first to show your notes";

  static int multiplyBy2(int x) => x * 2;
}

//another concepts for Static Class Members
//using enums as values for the class field
enum PhysicistType { theoretical, experimental, both }

class Physicist {
  String name;
  PhysicistType type; //type of this field is an enum of type PhysicistType
  // Internal constructor
  Physicist._internal(this.name, this.type);
  // Static property
  static var physicistCount = 0;
  // Static method that return object from the class using the private constructor
  static Physicist newPhysicist(String name, PhysicistType type) {
    physicistCount++;
    return Physicist._internal(name, type);
  }
}

final emmy = Physicist.newPhysicist("Emmy Noether", PhysicistType.theoretical);
final lise = Physicist.newPhysicist("Lise Meitner", PhysicistType.experimental);
//print(Physicist.physicistCount); // 2 used in main

//Class Inheritance
// Base aka parent class
class Person {
  // Parent properties inherited by child
  String firstName;
  String lastName;
  double totalGrade = 100.0;
  // Parent class constructor
  Person(this.firstName, this.lastName);
  Person.named(this.firstName) : lastName = '';

  // Parent class methods
  String get fullName => '$firstName $lastName';
  double calcPercent({double? grade}) {
    return grade ?? 0 / totalGrade * 100;
  }

  // Optional @override annotation
  // All class hierarchies and types have Object as root class
  @override
  String toString() => fullName;
}

// Subclass aka child class
class Student extends Person {
  // Properties specific to child
  // Call super (parent) class constructor(default or main)
  //i.e (initializing the parent class & this child class required fields
  double myGrade;
  double myPenalty;

  Student(String firstName, String lastName, double grade, double penalty)
      : myGrade = grade,
        myPenalty = penalty,
        super.named(firstName);
//override method with or without calling the super overridden method
  @override
  double calcPercent({double? grade}) {
    return super.calcPercent(grade: grade ?? myGrade - myPenalty);
    //return (grade?? myGrade - myPenalty)/totalGrade*100;
  }

  // Optional override annotation on parent method
//override (reverse order (last name first))
  @override
  String get fullName => '$lastName, $firstName';
}

//implementation
final jon = Person('Jon', 'Snow');
final jane = Student('Jane', 'Snow', 90.0,
    10.0) // Calls the child constructor which initializes the parent one
  ..calcPercent(); //calls the overriding method which calls the overridden one
// .. is cascade operator (doing multiple operations sequentially on an object)
//print(jon); // Jon Snow //uses the overriding toString method
// Use of toString in parent, which in turn uses the child class fullName getter method which overrides the parent one
//print(jane); // Snow, Jane

/*
//TODO Cascade syntax ..
gotgStar // Get an object
 ..name = 'Zoe' // Use property
 ..signOnForSequel('Star Trek'); // Call method

*/

//TODO abstract vs late fields (can late cause runtime error and become null in
//abstract and interfaces and classes how to avoid this)
/*in abstract classes
abstract fields : forces override in the child or the implementing class so avoid
   being null
late fields : doesn't
N.B. implement forces override of all members even late and concrete ones
*/

//Abstract Classes, Interfaces, Mixins

/*
classes (concrete) => doesn't allow abstract fields or methods and can make 
    objects (instances) of them 
Abstract classes => permits 0 or more abstract fields and methods and can,t make 
    objects from it.
Interfaces =>  Dart does not have a syntax for declaring interfaces.
    concrete and abstract Classes themselves can be used as interfaces in Dart 
    by just using implements keyWord.and u must override every member in the
    implemented "interface" even if it was concrete
*/

/*
extends : accepts only one concrete or abstract class and forces implementation 
    for abstract members only 
implements: accepts one or more concrete or abstract class and forces overriding
     all members even concrete ones (treating it as if it was an interface)
     and doesn't require implemented class constructor to be initialized
     i.e. as implements keyword implies it extracts and utilize its content of 
     methods and fields without using the class it self
*/
abstract class AbsClass {
  abstract int absVar; //abstract field (makes abstract setter & getter methods)
  late int lateVar; //late field to avoid null safety error (can cause null
  //values in case of inheritance)
  int concVar = 0; //normal initialized field
  AbsClass({required this.concVar}); //constructor
  int absClassConcMethod() => 1; //concrete method
  int absClassAbsMethod(); //abstract method
}

class ConcClass {
  int myVar;
  ConcClass({required this.myVar});
  int myMethod() => 0;
  //int absMethod(); //error abstract methods not allowed in concrete classes
}

//extending abstract classes forces overriding abstract members only
class InheritAbsClass extends AbsClass {
  @override
  int absVar = 0;

  InheritAbsClass({required super.concVar});

  @override
  int absClassAbsMethod() => 0;
}

//implements forces overriding all members (treating it as interface)
class ImplementAbsClass implements AbsClass {
  //implemented class constructor is not required
  @override
  int absVar = 0;

  @override
  int lateVar = 0;

  @override
  int concVar = 0;

  @override
  int absClassAbsMethod() => 0;

  @override
  int absClassConcMethod() => 0;
}

//same for implemented concrete classes
class ImplementConcClass implements ConcClass {
  @override
  int myVar = 0;

  @override
  int myMethod() => 0;
}

//implementation of multiple classes and make it abstract
abstract class MultiImplementation implements ConcClass, AbsClass {
//no override required here but all members(of both classes) will be required in
// the classes that inherit or implement this one
}

//inherit concrete class & implementing abstract one and make it abstract
abstract class InhConcImpAbs extends ConcClass implements AbsClass {
  InhConcImpAbs({required super.myVar});
//no override required here but overriding all members (of the implemented class
// only) will be required in the classes that inherit or implement this one
}

//e.g.
//class Imp extends MultiImplementation{} / require override all
//class InhImp extends InhConcImpAbs{} //require override AbsClass members only

enum BloodType { warm, cold }

abstract class Animal {
  abstract BloodType bloodType; // Base class property
  void goSwimming(); // Abstract method without implementation
}

mixin Milk {
  late bool hasMilk;
  bool doIHaveMilk() => hasMilk;
}

// Concrete class inheriting from abstract class
class Cat extends Animal with Milk {
  @override
  BloodType bloodType = BloodType.warm; // Set value for property
  Cat() {
    hasMilk = true;
  } // Set mixin property
  // Concrete subclass must implement abstract methods
  @override
  void goSwimming() {
    print("No thanks!");
  }
}

// Concrete class that also implements Comparable interface
class Dolphin extends Animal implements Comparable<Dolphin> {
  @override
  BloodType bloodType = BloodType.warm;
  double length; // Concrete subclass property
  Dolphin(this.length); // Concrete subclass constructor
  // Concrete subclass must implement abstract methods
  @override
  void goSwimming() {
    print("Click! Click!");
  }

  // Also must implement interface methods
  @override
  int compareTo(other) => length.compareTo(other.length);
  @override
  String toString() => '$length meters';
}

class Reptile extends Animal with Milk {
  @override
  BloodType bloodType = BloodType.cold;
  Reptile() {
    hasMilk = false;
  }
  @override
  void goSwimming() {
    print("Sure!");
  }
}

// var snake = Animal(); // error: can't instantiate abstract class
// Can instantiate concrete classes
var garfield = Cat();
var flipper = Dolphin(4.0);
var snake = Reptile();

//TODO Implementation
/*
//Call concrete methods
flipper.goSwimming(); // Click! Click!
garfield.goSwimming(); // No thanks!
// Use interface implementation
var orca = Dolphin(8.0); var alpha = Dolphin(5.0);
var dolphins = [alpha, orca, flipper];
dolphins.sort();
print(dolphins); // [4 meters, 5 meters, 8 meters]
print(snake.doIHaveMilk()); // false
print(garfield.doIHaveMilk()); // true

*/

class X {
  int z;

  int get ze => z;

  set ze(int z) => z = z;

  X(int a) : this.z = a;
}
