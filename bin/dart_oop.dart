import 'package:dart_oop/dart_oop.dart' as dart_oop;

void main2(List<String> arguments) {
  print('Hello world: ${dart_oop.calculate()}!');
}

//Declaring basic class without constructor
class Car {
  String brand = " ";
  int year = 0;

  void displayInfo() {
    print('Brand: $brand, Year: $year');
  }
}

//Declaring Class with constructor
class Car2 {
  String brand;
  int year;

  //Default Constructor
  Car2(this.brand, this.year);

  //Named Constructor
  Car2.namedConstructor(this.brand) : year = 2024;

  void displayInfo() {
    print('Brand: $brand, Year: $year');
  }
}

//Encapsulation
class Account {
  String _accountHolder;
  double _balance;

  Account(this._accountHolder, this._balance);

  // public method to access private property
  String get accountHolder => _accountHolder;

  void deposit(double amount) {
    _balance += amount;
    print('Deposited: \$$amount. New Balance \$$_balance');
  }

  void withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
      print('Withdraw: \$$amount. New Balance: \$$_balance');
    } else {
      print('Insufficient balance');
    }
  }
}

//Inheritance
class Animal {
  String animalName = "Matmat";

  void eat() {
    print('Eating...');
  }
}

class Dog extends Animal {
  void bark() {
    print('Barking... $animalName');
  }

  void callParentMethod() {
    print("Call Parent Method:");
    eat();
  }

  void useSuperKeyword() {
    print('useSuperKeyword: ${super.animalName}');
    super.eat();
  }
}

//Inheritance using constructor
class Animal3 {
  String animalName = "Mitmit";

  Animal3(animalName);
}

class Dog3 extends Animal3 {
  String breed = "aspin";
  Dog3(String animalName, this.breed) : super(animalName);

  void displayInfo() {
    print('Name: $animalName, Breed: $breed');
  }
}

//Polymorphism
class Animal2 {
  void sound() {
    print('Animal makes a sound');
  }
}

class Cat extends Animal2 {
  @override
  void sound() {
    print('Meow');
  }
}

class Dog2 extends Animal2 {
  @override
  void sound() {
    print('Bark');
  }
}

//Abstraction
abstract class Shape {
  void draw();
}

class Circle extends Shape {
  @override
  void draw() {
    print('Drawing a Circle');
  }
}

//Interfaces and Mixins
class Printer {
  void printDocument() {
    print('Printing document...');
  }
}

class Scanner {
  void scanDocument() {
    print('Scanning document...');
  }
}

class AllInOne implements Printer, Scanner {
  @override
  void printDocument() {
    print('All-in-one Printing...');
  }

  @override
  void scanDocument() {
    print('All-in-one Scanning...');
  }
}

// Static members
class Calculator {
  static const double pi = 3.14;

  static double calculateArea(double radius) {
    return pi * radius * radius;
  }
}

//Advanced using of interfaces and mixins
abstract class Authenticatetable {
  bool login(String username, String password);
}

abstract class Loggable {
  void logEvent(String event);
}

mixin AuditLogger {
  void logAudit(String action) {
    print("Audit Log: $action");
  }
}

mixin ActivityTracker {
  List<String> _activityLog = [];

  void addActivity(String activity) {
    _activityLog.add(activity);
    print("Activity Added: $activity");
  }

  void showActivities() {
    print("Activities: $_activityLog");
  }
}

class User {
  final String username;

  User(this.username);
}

class Admin extends User implements Authenticatetable, Loggable {
  Admin(String username) : super(username);

  //Implementing Authenticable
  @override
  bool login(String username, String password) {
    print("$username logged in as Admin");
    return true;
  }

  //Implementing Loggable
  @override
  void logEvent(String event) {
    print("Admin log: $event");
  }
}

//Extending Admin with Mixins
class SuperAdmin extends Admin with AuditLogger, ActivityTracker {
  SuperAdmin(String username) : super(username);

  void manageSystem() {
    logAudit("Systenm setting updated.");
    addActivity("Managed system settings.");
  }
}

void main() {
//Declaring basic class without constructor
  Car myCar = Car();
  myCar.brand = "Toyota";
  myCar.year = 2022;
  myCar.displayInfo();

  //Declaring class with constructor
  Car2 car = Car2('Toyota', 2022);
  Car2.namedConstructor('Honda');
  car.displayInfo();

  //Encapsulation
  Account account = Account('James', 5000);
  account.deposit(200);
  account.withdraw(2000);

  //Inheritance
  Dog dog = Dog();
  dog.eat();
  dog.bark();
  dog.callParentMethod();
  dog.useSuperKeyword();

  //Inheritance using constructor
  Dog3 dog3 = Dog3("Mitmit", "Aspin");
  dog3.displayInfo();

  //Polymorphism
  Animal2 animal2 = Dog2();
  animal2.sound();
  animal2 = Cat();
  animal2.sound();

  //Abstraction
  Shape shape = Circle();
  shape.draw();

  //Interfaces and Mixins
  AllInOne device = AllInOne();
  device.printDocument();
  device.scanDocument();

  //Static members
  print(Calculator.calculateArea(5));

  //Advanced using of interfaced and mixins
  Admin admin = Admin("AdminUser");
  admin.login("AdminUser", "password123");
  admin.logEvent("User Management Acessed");

  SuperAdmin superAdmin = SuperAdmin("SuperAdminUser");
  superAdmin.login("SuperAdminUser", "securePassword");
  superAdmin.logEvent("Critical Settings Accessed");
  superAdmin.manageSystem();
  superAdmin.showActivities();
}
