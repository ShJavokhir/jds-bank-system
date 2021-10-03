import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_app/app/data/config.dart';
import 'package:mobile_app/app/data/models/visa_card_model.dart';

class HomeController extends GetxController {
  var cardNumber = ''.obs;
  var cardFullName = ''.obs;
  var expiryDate = ''.obs;
  var cardBalance = 0.obs;
  var cardCashBack = 0.obs;
  var cardStatus = true.obs;

  //TODO: Implement HomeController
  Future<VisaCardModel> fetchData()async{
    final dio = new Dio();
    final box = GetStorage();
    var formData = await{
      'cardNumber': box.read('cardNumber').toString(),
      'cardCvv': box.read('cardCvv').toString(),
      'cardExpiryDate': box.read('cardExpiryDate').toString(),
    };
    print('${Config.API_URL}/card/virtual/getCardInfo');
    var response = await dio.post('${Config.API_URL}/card/virtual/getCardInfo', data: formData);
    return VisaCardModel.fromJson(response.data);
  }

  final count = 0.obs;
  @override
  void onInit() async{
    update1();
    super.onInit();
  }
  Future<void> changeCardStatus() async{
    final dio = new Dio();
    final box = GetStorage();
    var formData = await{
      'cardNumber': box.read('cardNumber').toString(),
      'cardCvv': box.read('cardCvv').toString(),
      'cardExpiryDate': box.read('cardExpiryDate').toString(),
    };
    print('${Config.API_URL}/card/virtual/getCardInfo');
    var response = await dio.post(cardStatus.value?'${Config.API_URL}/card/virtual/deactivate':'${Config.API_URL}/card/virtual/activate', data: formData);
  update1();
  }

  Future<void> update1()async{
    print('update home');
    VisaCardModel aa = await fetchData();
    print(aa.cardNumber);
    cardNumber.value = aa.cardNumber;
    cardFullName.value = aa.fullName;
    expiryDate.value = aa.cardExpiryDate;
    cardBalance.value = aa.balance;
    cardCashBack.value = aa.cashBack;
    cardStatus.value = aa.isActive;

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
