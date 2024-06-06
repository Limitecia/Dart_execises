class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

class MockSpaceship implements Spacecraft {
  //实现接口
  @override
  DateTime? launchDate;

  @override
  String name;

  MockSpaceship({required this.name, this.launchDate});

  @override
  int? get launchYear => launchDate?.year;

  @override
  void describe() {
    print('MockSpaceship: $name');
  }
}

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

//继承抽象类
class MockSpaceship2 extends Describable {
  @override
  void describe() {
    print('OK');
  }
}

void main(List<String> args) {
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  var orbiter =
      MockSpaceship(name: 'Orbiter I', launchDate: DateTime(2021, 9, 5));
  orbiter.describe();

  var orbiter3 = MockSpaceship(name: 'Orbiter III');
  orbiter3.describe();

  var orbiter4 = MockSpaceship2();
  orbiter4.describe();
}
