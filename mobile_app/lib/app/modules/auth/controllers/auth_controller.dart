import 'dart:convert';

import 'package:dio/dio.dart';
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
    dio = new Dio();
    var formData = {
      'fullName': '$fullName',
    };
    var response = await dio.post('${Config.API_URL}/card/virtual/create', data: formData);
    final aa = VisaCardModel.fromJson(response.data);
    final box = GetStorage();
    box.write('cardNumber', aa.cardNumber);
    box.write('cardCvv', aa.cardCvv);
    box.write('cardExpiryDate', aa.cardExpiryDate);

    //saveToSharedPreferences
  }

  void loginToVisa()async{
    dio = new Dio();
    var formData = {
      'cardNumber': '$cardNumber',
      'cardCvv': '$cardCvv',
      'cardExpiryDate': '$cardExpiryDate',
    };
    var response = await dio.post('$Config.API_URL/card/virtual/validate', data: formData);
    if(response.statusCode == 200){
      //save sharedprefernces
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
      Get.toNamed(Routes.DASHBOARD);
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
