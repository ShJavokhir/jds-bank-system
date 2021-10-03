import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/data/colors.dart';
import 'package:mobile_app/app/modules/transfers/views/payments_card_view.dart';

import '../controllers/payments_controller.dart';

class PaymentsView extends GetView<PaymentsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
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
        child: SafeArea(
          child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(height: 50,),
                Text(
                    "Payments for Goods",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600
                    )
                ),
                SizedBox(height: 35),
                ...controller.payments


              ]
          ),
        ),
      )
    );
  }
}
