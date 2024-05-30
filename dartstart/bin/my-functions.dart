int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main(List<String> args) {
  var result = fibonacci(20);
  print(result);

  var flybyObjects = [
    'Jupiter',
    'Saturn',
    'Uranus',
    'Neptune',
    'turnout',
    'turnoff'
  ];
  flybyObjects.where((name) => name.contains('turn')).forEach(print);
  /**=> (胖箭头) 简写语法用于仅包含一条语句的函数。该语法在将匿名函数作为参数传递时非常有用，这句代码在Python中是这样写的：
   * flyby_objects = [...]  # 假设这是一个字符串列表
    for name in flyby_objects:
        if 'turn' in name:
        print(name)
   */
}
