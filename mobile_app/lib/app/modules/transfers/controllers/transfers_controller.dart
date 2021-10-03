import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_app/app/data/config.dart';
import 'package:mobile_app/app/data/models/transfers_model.dart';
import 'package:mobile_app/app/data/models/visa_card_model.dart';
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
  ].obs;

  var tempPaymentName = ''.obs;
  var tempAccountNumber = 0.obs;
  var tempReceiverCardNumber = ''.obs;
  var tempAmountToSent = 0.obs;

  Future<List<TransfersModel>> fetchData()async{

    final dio = new Dio();
    final box = GetStorage();
    try{
    var formData = await{
      'cardNumber': box.read('cardNumber').toString(),
      'cardCvv': box.read('cardCvv').toString(),
      'cardExpiryDate': box.read('cardExpiryDate').toString(),
    };

    var response = await dio.post('${Config.API_URL}/transaction/getCardTransfers', data: formData);
    print('${Config.API_URL}/transaction/getCardTransfers');
    return (response.data as List)
        .map((x) => TransfersModel.fromJson(x))
        .toList();

    //VisaCardModel.fromJson(response.data);


  } catch (e) {
  print(e);
  Get.snackbar("Xatolik", e.toString());
  return [];
  }
  }

  Future<void> updateData()async{
    transfers.clear();
    final transfers1 = await fetchData();
    transfers1.forEach((element) {
      transfers.add(
          MoneyTransferCard(cardNumber:  element.cardReceived, amount: element.amount,)
      );
    });

  }

  Future<void> transferMoney()async {
    try {
      print('$tempReceiverCardNumber $tempAmountToSent');
      final dio = new Dio();

      final box = GetStorage();

      final cardNumber = box.read('cardNumber').toString();
      final cardCvv = box.read('cardCvv').toString();
      final cardExpiryDate = box.read('cardExpiryDate').toString();

      var formData = await{
        "cardToReceive": '${tempReceiverCardNumber.value}',
        "cardNumberToTransfer": cardNumber,
        "cardCvvToTransfer": cardCvv,
        "cardExpiryDateToTransfer": cardExpiryDate,
        "amountToTransfer": tempAmountToSent.value
      };

      print(formData);
      var response = await dio.post(
          '${Config.API_URL}/transaction', data: formData);
      Navigator.of(Get.overlayContext!).pop();
    } catch (e) {
      print(e);
      Get.snackbar("Xatolik", e.toString());
    }
  }
    Future<void> makePayment() async {
      try {
        print('$tempReceiverCardNumber $tempAmountToSent');
        final dio = new Dio();

        final box = GetStorage();

        final cardNumber = box.read('cardNumber').toString();
        final cardCvv = box.read('cardCvv').toString();
        final cardExpiryDate = box.read('cardExpiryDate').toString();

        var formData = await{

            "cardNumber": cardNumber,
            "cardCvv": cardCvv,
            "cardExpiryDate": cardExpiryDate,
            "amount": tempAmountToSent.value,
            "goodsName": tempPaymentName.value,
            "goodsAccountNumber": tempAccountNumber.value

        };

        print(formData);
        var response = await dio.post(
            '${Config.API_URL}/merchant/payForGoods', data: formData);
        Navigator.of(Get.overlayContext!).pop();
      } catch (e) {
        print(e);
        Get.snackbar("Xatolik", e.toString());
      }
    }

    final count = 0.obs;
    @override
    void onInit() {
      super.onInit();
      updateData();
      //print(fetchData());
    }

    @override
    void onReady() {
      super.onReady();
    }

    @override
    void onClose() {}
    void increment() => count.value++;
  }