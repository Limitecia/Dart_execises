/*import 'dart:async';

Future<String> fetchData(String url) async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data from $url';
}

void main() async {
  print('Starting to fetch data...');

  // 同时启动多个异步操作
  Future<String> data1 = fetchData('https://api.example.com/data1');
  Future<String> data2 = fetchData('https://api.example.com/data2');
  Future<String> data3 = fetchData('https://api.example.com/data3');

  // 等待所有异步操作完成
  List<String> results = await Future.wait([data1, data2, data3]);

  // 打印结果
  results.forEach((result) => print(result));

  print('Finished fetching data.');
}*/

import 'dart:io';

Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print('File for $object already exists. It was modified on $modified.');
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
}

void main(List<String> args) {
  //延迟两秒输出
  Future.delayed(Duration(seconds: 2), () {
    print('Two seconds have passed.');
  });
  print('Starting to create descriptions...');
}
