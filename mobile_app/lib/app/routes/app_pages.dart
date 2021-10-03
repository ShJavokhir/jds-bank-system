import 'package:get/get.dart';

import 'package:mobile_app/app/modules/auth/bindings/auth_binding.dart';
import 'package:mobile_app/app/modules/auth/views/auth_view.dart';
import 'package:mobile_app/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:mobile_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:mobile_app/app/modules/home/bindings/home_binding.dart';
import 'package:mobile_app/app/modules/home/views/home_view.dart';
import 'package:mobile_app/app/modules/payments/bindings/payments_binding.dart';
import 'package:mobile_app/app/modules/payments/views/payments_view.dart';
import 'package:mobile_app/app/modules/transfers/bindings/transfers_binding.dart';
import 'package:mobile_app/app/modules/transfers/views/transfers_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFERS,
      page: () => TransfersView(),
      binding: TransfersBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENTS,
      page: () => PaymentsView(),
      binding: PaymentsBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
  ];
}
