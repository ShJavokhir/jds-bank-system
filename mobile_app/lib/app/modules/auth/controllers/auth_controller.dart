import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_app/app/data/config.dart';
import 'package:mobile_app/app/data/models/visa_card_model.dart';
import 'package:mobile_app/app/routes/app_pages.dart';

class AuthController extends GetxController {


  //TODO: Implement AuthController
  var fullName = ''.obs;
  var isLoginState = false.obs;
  var cardNumber = ''.obs;
  var cardCvv = ''.obs;
  var cardExpiryDate = ''.obs;
  late Dio dio = Dio();

  Future<void> createNewVisa()async{
    try {
      dio = new Dio();
      var formData = {
        'fullName': '$fullName',
      };
      var response = await dio.post(
          '${Config.API_URL}/card/virtual/create', data: formData);
      final aa = VisaCardModel.fromJson(response.data);
      final box = GetStorage();
      box.write('cardNumber', aa.cardNumber);
      box.write('cardCvv', aa.cardCvv);
      box.write('cardExpiryDate', aa.cardExpiryDate);
      Get.snackbar("Info", "Succesfully created", colorText: Colors.white, icon: Icon(Icons.done_outline, color: Colors.grey));
      Get.toNamed(Routes.DASHBOARD);
    }catch(e){
      Get.snackbar("Xatolik", e.toString(), colorText: Colors.white, icon: Icon(Icons.error, color: Colors.red));
    }
    //saveToSharedPreferences
  }

  Future<void> loginToVisa()async{
    final dio = new Dio();
    final box = GetStorage();
    try {
      var formData = await{
        'cardNumber': cardNumber.value,
        'cardCvv': cardCvv.value,
        'cardExpiryDate': cardExpiryDate.value,
      };
      print('${Config.API_URL}/card/virtual/getCardInfo');
      var response = await dio.post(
          '${Config.API_URL}/card/virtual/getCardInfo', data: formData);
      final aa = VisaCardModel.fromJson(response.data);
      box.write('cardNumber', aa.cardNumber);
      box.write('cardCvv', aa.cardCvv);
      box.write('cardExpiryDate', aa.cardExpiryDate);

        Get.toNamed(Routes.DASHBOARD);


    }catch(e){
      Get.snackbar("Xatolik", e.toString(), colorText: Colors.white, icon: Icon(Icons.error, color: Colors.red));
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
    final box = GetStorage();
    if(box.hasData('cardNumber')){
      print("borr");
      Get.toNamed(Routes.DASHBOARD);
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
