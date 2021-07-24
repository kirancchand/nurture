import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nurture/common/constants.dart';
class SpinController extends GetxController {
  var spin = false.obs;

  show() {
    spin.value = true;
  }

  hide() {
    spin.value = false;
  }
}

class Spinner extends StatelessWidget {
  Spinner({required this.child});
  Widget child;

  SpinController controller = Get.put(SpinController());
  @override
  Widget build(BuildContext context) {
    print("hyy");
    return Obx(
          () => ModalProgressHUD(
              inAsyncCall: controller.spin.value,
              child: child,
              color: Colors.black87,
              progressIndicator: SpinWidget(),
      ),
    );
  }
}

class SpinWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Material(
          elevation: 5,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            width: width(context) * .8,
            height: height(context) * .1,
            padding: EdgeInsets.symmetric(horizontal: width(context) * .1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  strokeWidth: 4,
                  valueColor: AlwaysStoppedAnimation(colorblue),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Please wait...',
                      style: TextStyle(color: colorblue, fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

showSpinner() {
  SpinController controller = Get.find<SpinController>();
  controller.show();
}

hideSpinner() {
  SpinController controller = Get.find<SpinController>();
  controller.hide();
}
