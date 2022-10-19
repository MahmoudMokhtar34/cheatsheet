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
  //print(iCanBeNull!.isEven); //skips compiler null checking & will cause run time error (exception) if it is null
  print(iCanBeNull
      ?.isEven); //conditional check if null will not execute operations on it & will return null
  //bool nonNull = iCanBeNull?.isEven; //will cause error (assigning nullable to non null variable)

  print(iCanBeNull ?? "it is null"); //if it is null take the right value
  int imNotNull =
      iCanBeNull ?? 1; //another example (if it is null take the right value)
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
  Semester semester;
  switch (month) {
    case Month.august:
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
  var numbers = [1, 2, 3, 4, 5, 6, 7];
  for (var number in numbers) {
    print(number);
  }
// Skip 3 with continue and exit loop with break
  for (var number in numbers) {
    if (number == 3) {
      continue;
    }
    if (number == 5) {
      break;
    }

    print(" --- $number --- ");
  }
// forEach with function argument
  numbers.forEach(print); // 1, 2, 3, 4 on separate lines
// forEach with anonymous function argument
  numbers = [13, 14, 15, 16];
  numbers.forEach((number) => print(number.toRadixString(16)));

// d, e, f, 10

//Functions
//Named function with required parameters
  bool isBanana(String fruit) {
    return fruit == 'banana';
  }

  var fruit = 'apple';
  isBanana(fruit); // false

// Optional parameters with square brackets [like a list of optional positional parameters]
//void func([int error]){}; //null safety error either int? or set default a value or make it required
  void fullName(String first, String last, [String title = ""]) {
    print("$title  $first $last".trimLeft());
  }

  fullName("Ray", "Wenderlich"); // Ray Wenderlich
  fullName("Albert", "Einstein", "Professor"); //Professor Albert Einstein

// Optional named arguments with braces {like a map of named parameters}
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
  int applyTo(int value, int Function(int) myFunc) {
    return myFunc(value);
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

// Closures
  Function applyMultiplier(num multiplier) {
    // Return value has access to multiplier
    return (num value) => value * multiplier;
  }

  var triple = applyMultiplier(3);
  triple(14.0); // 42.0
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

// Enumerations
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

/*


Collections: Lists
// Fixed-size list
var pastries = List<String>(3);
// Element access by index
pastries[0] = 'cookies';
pastries[1] = 'cupcakes';
pastries[2] = 'donuts';
// Growable list
List<String> desserts = [];
desserts.add('cookies');
// Initialize by growable list
var desserts = ['cookies', 'cupcakes', 'pie'];
// List properties and methods
desserts.length; // 3
desserts.first; // 'cookies'
desserts.last; // 'pie'
desserts.isEmpty; // false
desserts.isNotEmpty; // true
desserts.firstWhere((str) => str.length < 4));
// pie
// Collection if
var peanutAllergy = true;
var candy = [
 'junior mints',
 'twizzlers',
 if (!peanutAllergy) 'reeses'
];
// Collection for
var numbers = [1, 2, 3];
var doubledNumbers =
 [for (var number in numbers) 2 * number];
// [2, 4, 6]
Page 2 of 4
Dart 2 Cheat Sheet and Quick Reference
Source: raywenderlich.com. Visit for more Flutter/Dart resources and tutorials! Version 1.0.1. Copyright 2019 Razeware LLC. All rights reserved.
Collections: List Operations
// Spread Operator and null-spread operator
var pastries = ['cookies', 'cupcakes'];
var desserts = ['donuts', ...pastries, ...?candy];
// Map to transform list
var numbers = [1, 2, 3, 4];
var squares = numbers.map(
 (number) => number * number).toList();
// [1, 4, 9, 16]
// Filter list using where
var evens = squares.where(
 (square) => square.isEven); // (4, 16)
// Reduce list to combined value
var amounts = [199, 299, 299, 199, 499];
var total = amounts.reduce(
 (value, element) => value + element); // 1495
Collections: Sets
// Create set of int
var someSet = <int>{};
// Set type inference
var anotherSet = {1, 2, 3, 1};
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
Collections: Maps
// Map from String to int
var emptyMap = Map<String, int>();
// Map from String to String
var avengers = {
 "Iron Man": "Suit", "Captain America": "Shield",
 "Thor": "Hammer"};
// Element access by key
var ironManPower = avengers["Iron Man"]; // Suit
avengers.containsKey("Captain America"); // true
avengers.containsValue("Arrows"); // false
// Access all keys and values
avengers.keys.forEach(print); // Iron Man, Captain
America, Thor
avengers.values.forEach(print); // Suit, Shield,
Hammer
// Loop over key-value pairs
avengers.forEach((key, value) => print('$key ->
$value'));
Classes and Objects
class Actor {
 // Properties
 String name;
 var filmography = <String>[];

 // Short-form constructor
 Actor(this.name, this.filmography);

 // Named constructor
 Actor.rey({this.name = "Daisy Ridley"}) {
 filmography = ['The Force Awakens', 'Murder on
the Orient Express'];
 }

 // Calling other constructors
 Actor.inTraining(String name) : this(name, []);

 // Constructor with initializer list
 Actor.gameOfThrones(String name)
 : this.name = name, this.filmography = ['Game
of Thrones'] {
 print('My name is ${this.name}');
 }

 // Getters and Setters
 String get debut => '$name debuted in $
{filmography.first}';
 set debut(String value) => filmography.insert(0,
value);

 // Methods
 void signOnForSequel(String franchiseName) {
 filmography.add('Upcoming $franchiseName
sequel');
 }

 // Override from Object
 String toString() =>
 "${[name, ...filmography].join("\n- ")}\n";
}
var gotgStar = Actor('Zoe Saldana', []);
gotgStar.name = 'Zoe Saldana';
gotgStar.filmography.add('Guardians of the Galaxy');
gotgStar.debut = 'Center Stage';
print(Actor.rey().debut); // The Force Awakens
var kit = Actor.gameOfThrones('Kit Harington');
var star = Actor.inTraining('Super Star');
// Cascade syntax ..
gotgStar // Get an object
 ..name = 'Zoe' // Use property
 ..signOnForSequel('Star Trek'); // Call method
Static Class Members
enum PhysicistType { theoretical, experimental, both
}
class Physicist {
 String name;
 PhysicistType type;
 // Internal constructor
 Physicist._internal(this.name, this.type);
 // Static property
 static var physicistCount = 0;
 // Static method
 static Physicist newPhysicist(
 String name,
 PhysicistType type) {
 physicistCount++;
 return Physicist._internal(name, type);
 }
}
final emmy = Physicist.newPhysicist(
 "Emmy Noether", PhysicistType.theoretical);
final lise = Physicist.newPhysicist(
 "Lise Meitner", PhysicistType.experimental);
print(Physicist.physicistCount); // 2
Page 3 of 4
Dart 2 Cheat Sheet and Quick Reference
Source: raywenderlich.com. Visit for more Flutter/Dart resources and tutorials! Version 1.0.1. Copyright 2019 Razeware LLC. All rights reserved.
Class Inheritance
// Base aka parent class
class Person {
 // Parent properties inherited by child
 String firstName;
 String lastName;
 // Parent class constructor
 Person(this.firstName, this.lastName);
 // Parent class method
 String get fullName => '$firstName $lastName';
 // Optional @override annotation
 // All class hierarchies and types have Object as
root class
 @override
 String toString() => fullName;
}
// Subclass aka child class
class Student extends Person {
 // Properties specific to child
 var grades = <String>[];
 // Call super on parent constructor
 Student(String firstName, String lastName)
 : super(firstName, lastName);
 // Optional override annotation on parent method
override
 @override
 String get fullName => '$lastName, $firstName';
}
final jon = Person('Jon', 'Snow');
final jane = Student('Jane', 'Snow'); // Calls
parent constructor
print(jon); // Jon Snow
// Use toString in parent, in turn using subclass
override of fullName
print(jane); // Snow, Jane
Abstract Classes, Interfaces, Mixins
enum BloodType { warm, cold }
abstract class Animal {
 BloodType bloodType; // Base class property
 void goSwimming(); // Abstract method without
implementation
}
mixin Milk {
 bool hasMilk;
 bool doIHaveMilk() => hasMilk;
}
// Concrete class inheriting from abstract class
class Cat extends Animal with Milk {
 BloodType bloodType = BloodType.warm; // Set value
for property
 Cat() { hasMilk = true; } // Set mixin property
 // Concrete subclass must implement abstract
methods
 @override
 void goSwimming() { print("No thanks!"); }
}
// Concrete class that also implements Comparable
interface
class Dolphin extends Animal implements
Comparable<Dolphin> {
 BloodType bloodType = BloodType.warm;
 double length; // Concrete sublcass property
 Dolphin(this.length); // Concrete subclass
constructor
 // Concrete subclass must implement abstract
methods
 @override
 void goSwimming() { print("Click! Click!"); }
 // Also must implement interface methods
 @override
 int compareTo(other) =>
length.compareTo(other.length);
 @override
 String toString() => '$length meters';
}
class Reptile extends Animal with Milk {
 BloodType bloodType = BloodType.cold;
 Reptile() { hasMilk = false; }
 @override
 void goSwimming() { print("Sure!"); }
}
// var snake = Animal(); // error: can't instantiate
abstract class
// Can instantiate concrete classes
var garfield = Cat();
var flipper = Dolphin(4.0);
var snake = Reptile();
// Call concrete methods
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

