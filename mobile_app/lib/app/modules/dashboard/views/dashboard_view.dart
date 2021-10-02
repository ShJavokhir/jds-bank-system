import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/data/colors.dart';
import 'package:mobile_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:mobile_app/app/modules/home/views/home_view.dart';
import 'package:mobile_app/app/modules/payments/views/payments_view.dart';
import 'package:mobile_app/app/modules/transfers/views/transfers_view.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  AppColors.dark_color_1,
                  AppColors.dark_color_2,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomeView(),
                TransfersView(),
                PaymentsView()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.yellow,
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              showSelectedLabels: true,
              //selectedLabelStyle: TextStyle(color: Colors.orangeAccent),
              //unselectedLabelStyle: TextStyle(color: Colors.orangeAccent),
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,

              backgroundColor: Colors.transparent,
              elevation: 0,
              items: [
                _bottomNavigationBarItem(
                  icon: CupertinoIcons.home,
                  label: 'Home',
                ),
                _bottomNavigationBarItem(
                  icon: CupertinoIcons.sportscourt,
                  label: 'Transfers',
                ),
                _bottomNavigationBarItem(
                  icon: CupertinoIcons.bell,
                  label: 'Payments',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}