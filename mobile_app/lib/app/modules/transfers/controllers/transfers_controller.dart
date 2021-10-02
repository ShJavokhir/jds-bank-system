import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/widgets/card_money_transfer_card.dart';

class TransfersController extends GetxController {
  //TODO: Implement TransfersController
  List<Widget> transfers = [
    MoneyTransferCard(cardNumber: "8600 **** **** 1293", amount: 100),
    MoneyTransferCard(cardNumber: "8600 **** **** 1293", amount: -244),
    MoneyTransferCard(cardNumber: "8600 **** **** 1293", amount: -100),
    MoneyTransferCard(cardNumber: "8600 **** **** 1293", amount: 100),
    MoneyTransferCard(cardNumber: "8600 **** **** 1293", amount: -244),
    MoneyTransferCard(cardNumber: "8600 **** **** 1293", amount: -100),
    MoneyTransferCard(cardNumber: "8600 **** **** 1293", amount: 100),
    MoneyTransferCard(cardNumber: "8600 **** **** 1293", amount: -244),
    MoneyTransferCard(cardNumber: "8600 **** **** 1293", amount: -100),
    MoneyTransferCard(cardNumber: "8600 **** **** 1293", amount: 100),
    MoneyTransferCard(cardNumber: "8600 **** **** 1293", amount: -244),
    MoneyTransferCard(cardNumber: "8600 **** **** 1293", amount: -100),


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
