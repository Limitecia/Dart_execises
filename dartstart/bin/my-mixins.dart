//Mixin 是一种在多个类层次结构中重用代码的方法。下面的是声明一个 Mixin 的做法：

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class Spaceship with Piloted {
  String name;
  DateTime? launchDate;

  Spaceship(this.name, this.launchDate);
}

void main() {
  var voyager = Spaceship('Voyager I', DateTime(1977, 9, 5));
  voyager.describeCrew();
}
