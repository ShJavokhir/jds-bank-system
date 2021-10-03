import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile_app/app/data/colors.dart';
import 'package:mobile_app/app/data/config.dart';
import 'package:mobile_app/app/data/models/goods_model.dart';
import 'package:mobile_app/app/modules/home/controllers/home_controller.dart';
import 'package:mobile_app/app/modules/transfers/controllers/transfers_controller.dart';
import 'package:mobile_app/app/modules/transfers/views/payments_card_view.dart';

class PaymentsController extends GetxController {
  List<Widget> payments = [
    PaymentsCardView(serviceName: "PUBG UC", amount: 100, icon: Icons.play_arrow),
    ].obs;
  var goodName = ''.obs;
  List<String> goods = ['Atto'].obs;

  Future<List<GoodsModel>> fetchData()async{

    final dio = new Dio();
    final box = GetStorage();

    try{
      goods.clear();
      var response = await dio.get('${Config.API_URL}/merchant/goods');
      print('${Config.API_URL}/merchant/getPaysForGoods');
      (response.data as List)
          .map((x) => {
            goods.add(x.toString()),
      })
          .toList();
      goodName.value = 'Evos';
      print(goods);

    }catch (e){

    }

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

  void payForServiceForm()async{

    TransfersController controller = Get.find();

    Get.defaultDialog(
        title: "Payment",
        middleText: "Please fill every field",
        backgroundColor: AppColors.dark_color_3,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),

        content: Obx(
          () => Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10,2,10,2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white)
                  ),
                  child:DropdownButton<String>(
                    value: goodName.value,
                    items: goods.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(color: Colors.blueAccent),),
                      );
                    }).toList(),
                    onChanged: (goodName1) {
                      goodName.value = goodName1 ?? "";
                      controller.tempPaymentName.value = goodName1 ?? "NULL";
                      },
                  )

                  /*TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Payment name",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      fillColor: Colors.blueAccent,
                      focusColor: Colors.blueAccent,
                      hoverColor: Colors.blueAccent,
                    ),
                    onChanged: (txt){
                      controller.tempPaymentName.value = txt;
                    },
                  ),*/
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
                      labelText: "Account number",
                      labelStyle: TextStyle(color: Colors.blueAccent),
                      fillColor: Colors.blueAccent,
                      focusColor: Colors.blueAccent,
                      hoverColor: Colors.blueAccent,
                    ),
                    onChanged: (txt){
                      controller.tempAccountNumber.value = int.parse(txt) ;
                    },
                  ),
                ),SizedBox(height: 10,),
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
        ),
        onConfirm: ()async{
          await controller.makePayment();
          Get.find<HomeController>().update1();

        },
        textConfirm: "Make Payment",
        textCancel: "Cancel"


    );


  }

}
