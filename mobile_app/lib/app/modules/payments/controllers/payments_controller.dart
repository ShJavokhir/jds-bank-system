import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_app/app/data/config.dart';
import 'package:mobile_app/app/data/models/goods_model.dart';
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
  ].obs;

  Future<List<GoodsModel>> fetchData()async{

    final dio = new Dio();
    final box = GetStorage();
    try{
      var formData = await{
        'cardNumber': box.read('cardNumber').toString(),
        'cardCvv': box.read('cardCvv').toString(),
        'cardExpiryDate': box.read('cardExpiryDate').toString(),
      };

      var response = await dio.post('${Config.API_URL}/merchant/getPaysForGoods', data: formData);
      print('${Config.API_URL}/merchant/getPaysForGoods');
      return (response.data as List)
          .map((x) => GoodsModel.fromJson(x))
          .toList();

      //VisaCardModel.fromJson(response.data);


    } catch (e) {
      print(e);
      Get.snackbar("Xatolik", e.toString());
      return [];
    }
  }

  Future<void> updateData()async{
    payments.clear();
    final payments1 = await fetchData();
    payments1.forEach((element) {
      payments.add(
          PaymentsCardView(amount: element.amount, serviceName: element.goodsName, icon: Icons.tv,)
      );
    });

  }

  final count = 0.obs;
  @override
  void onInit() {
    updateData();
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
