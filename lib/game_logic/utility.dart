import "dart:math";

dynamic getRandomElementFromList(List<dynamic> inputList) {
  final _random = new Random();
  return inputList[_random.nextInt(inputList.length)];
}
