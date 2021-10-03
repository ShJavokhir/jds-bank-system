import 'package:get/get.dart';
import 'package:mobile_app/app/modules/home/controllers/home_controller.dart';
import 'package:mobile_app/app/modules/payments/controllers/payments_controller.dart';
import 'package:mobile_app/app/modules/transfers/controllers/transfers_controller.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;


  void changeTabIndex(int index) {
    if(index == 3){
      print("hello");
      Get.find<HomeController>().update1();
      Get.find<TransfersController>().updateData();
      Get.find<PaymentsController>().updateData();
    }else{
      tabIndex = index;
      update();
    }

  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
