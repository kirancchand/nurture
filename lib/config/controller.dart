import 'package:get/get.dart';

class Controller extends GetxController {


  //Test
  RxInt log2 = 0.obs;
  void change() => log2.value++;
  int counter = 0;
  void increment() {
    counter++;
    update(); // use update() to update counter variable on UI when increment be called
  }
}