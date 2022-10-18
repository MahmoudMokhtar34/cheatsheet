class OuterLibClass {
  String publicField = 'can be accessed from anywhere';
  //prefer declaring private fields as final if they are not reassigned later in the library.
  final String _privateField = 'can be accessed in this library (file) only ';

  String _privateMethod() {
    return _privateField;
  }

  String publicMethod() {
    return _privateMethod();
  }
}

//using the private members in the same library
class SameLibClass {
  //private fields and methods can be accessed in the same library (file)
  OuterLibClass sameLibUse = OuterLibClass();

  void test() {
    sameLibUse._privateField;
    sameLibUse._privateMethod();
  }
}

class AssignedInAllConstructors {
  String _label; // LINT
  AssignedInAllConstructors(this._label);
  AssignedInAllConstructors.withDefault() : _label = '';
}
