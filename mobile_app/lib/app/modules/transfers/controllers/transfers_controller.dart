import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_app/app/data/colors.dart';
import 'package:mobile_app/app/data/config.dart';
import 'package:mobile_app/app/data/models/transfers_model.dart';
import 'package:mobile_app/app/data/models/visa_card_model.dart';
import 'package:mobile_app/app/modules/home/controllers/home_controller.dart';
import 'package:mobile_app/app/modules/payments/controllers/payments_controller.dart';
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
    print('update transfer');
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
      updateData();
      Get.snackbar("Info", 'Succesfull transfer', colorText: Colors.white, icon: Icon(Icons.done_outline, color: Colors.white));
    } catch (e) {
      print(e);
      Get.snackbar("Xatolik", e.toString(), colorText: Colors.white, icon: Icon(Icons.error, color: Colors.red));
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
        Get.find<PaymentsController>().updateData();
        Get.snackbar("Info", "Sucessfully paid", colorText: Colors.white, icon: Icon(Icons.done_outline, color: Colors.white,));

      } catch (e) {
//        print(e.text);
        Get.snackbar("Xatolik", e.toString(), colorText: Colors.white, icon: Icon(Icons.error, color: Colors.red));
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

  void transferMoneyForm()async{
    TransfersController controller = Get.find();

    Get.defaultDialog(
        title: "Transfer money",
        middleText: "Please fill every field",
        backgroundColor: AppColors.dark_color_3,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),

        content: Container(
          padding: EdgeInsets.all(5),
          child: Column(

            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10,2,10,2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.white)
                ),

                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Receiver's card number",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    fillColor: Colors.blueAccent,
                    focusColor: Colors.blueAccent,
                    hoverColor: Colors.blueAccent,

                  ),
                  onChanged: (txt){
                    controller.tempReceiverCardNumber.value = txt;
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.fromLTRB(10,2,10,2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.white)
                ),

                child: TextField(
                  style: TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                    labelText: "Amount to transfer",
                    labelStyle: TextStyle(color: Colors.blueAccent),
                    fillColor: Colors.blueAccent,
                    focusColor: Colors.blueAccent,
                    hoverColor: Colors.blueAccent,
                  ),
                  onChanged: (txt){
                    controller.tempAmountToSent.value = int.parse(txt) ;
                  },
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
        onConfirm: ()async{
          await controller.transferMoney();
          Get.find<HomeController>().update1();

        },
        textConfirm: "Transfer",
        textCancel: "Cancel"


    );
  }
  }