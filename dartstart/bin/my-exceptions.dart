import 'dart:io';

Future<void> describeFlybyObjects(List<String> flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}

void main(List<String> args) {
  var astronauts;
  if (astronauts == 0) {
    throw StateError('No astronauts.');
  }

  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  try {
    describeFlybyObjects(flybyObjects);
  } catch (e) {
    print('Caught error: $e');
  }
}
