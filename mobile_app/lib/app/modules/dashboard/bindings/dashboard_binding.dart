import 'package:get/get.dart';
import 'package:mobile_app/app/modules/payments/controllers/payments_controller.dart';
import 'package:mobile_app/app/modules/transfers/controllers/transfers_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<PaymentsController>(
          () => PaymentsController(),
    );
    Get.lazyPut<TransfersController>(
          () => TransfersController(),
    );
  }
}
