import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/modules/transfers/views/payments_card_view.dart';

class PaymentsController extends GetxController {
  List<Widget> payments = [
    PaymentsCardView(serviceName: "PUBG UC", amount: 100, icon: Icons.play_arrow),
    PaymentsCardView(serviceName: "Mediabay", amount: 100, icon: Icons.tv_outlined),
    PaymentsCardView(serviceName: "Arrows", amount: 100, icon: Icons.height),
    PaymentsCardView(serviceName: "PUBG UC", amount: 100, icon: Icons.thumb_up),
    PaymentsCardView(serviceName: "PUBG UC", amount: 100, icon: Icons.play_arrow),
    PaymentsCardView(serviceName: "Mediabay", amount: 100, icon: Icons.tv_outlined),
    PaymentsCardView(serviceName: "Arrows", amount: 100, icon: Icons.height),
    PaymentsCardView(serviceName: "PUBG UC", amount: 100, icon: Icons.thumb_up),
    PaymentsCardView(serviceName: "PUBG UC", amount: 100, icon: Icons.play_arrow),
    PaymentsCardView(serviceName: "Mediabay", amount: 100, icon: Icons.tv_outlined),
    PaymentsCardView(serviceName: "Arrows", amount: 100, icon: Icons.height),
    PaymentsCardView(serviceName: "PUBG UC", amount: 100, icon: Icons.thumb_up),
  ];

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
