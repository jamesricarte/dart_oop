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

  Car2(this.brand, this.year);

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

void main() {
//Declaring basic class without constructor
  Car myCar = Car();
  myCar.brand = "Toyota";
  myCar.year = 2022;
  myCar.displayInfo();

  //Declaring class with constructor
  Car2 car = Car2('Toyota', 2022);
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
}
