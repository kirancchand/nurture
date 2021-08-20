import 'package:get/get.dart';
import 'package:nurture/model/fee.dart';
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

class DropDown extends GetxController {
  var text = ''.obs;
}

class PendingDropDown extends GetxController {
  var text = ''.obs;
}

class YearController extends GetxController {
  var year = ''.obs;
}

class StudentController extends GetxController {
  Rx<FeeResponseModel> student = FeeResponseModel().obs;
}

class ChildrenController extends GetxController {
  List childrenlist = [].obs;
}

