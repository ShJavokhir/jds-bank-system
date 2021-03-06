

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/data/colors.dart';
import 'package:mobile_app/app/modules/payments/controllers/payments_controller.dart';
import 'package:mobile_app/app/modules/transfers/controllers/transfers_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Obx(
    () => Scaffold(
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
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),

            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "My Cards",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600
                      )
                      ),
              SvgPicture.asset(
                  'assets/visa.svg',
                  height: 90,
                  alignment: Alignment.center,
                  semanticsLabel: 'A red up arrow'
              ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _CustomCardView(),
                  SizedBox(height: 30),
                  _showAccountBalance(size),
                  SizedBox(height: 20),
                  _addCreditCardButton(),
                  SizedBox(height: 20),
                  _showAccountActions(size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _CustomCardView(){

    return GestureDetector(

      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color: Colors.black,
            offset: Offset(0.0, 2.0), //(x,y)
            blurRadius: 20.0,
          ),],
            image: DecorationImage(
              image: AssetImage("assets/background.jpg"),
              fit: BoxFit.cover,
            ),

            borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                    'assets/visa.svg',
                    height: 70,
                    color: Colors.white,
                    alignment: Alignment.center,
                    semanticsLabel: 'A red up arrow'
                ),SvgPicture.asset(
                    'assets/chip.svg',
                    height: 45,
                    color: Colors.white,
                    alignment: Alignment.center,
                    semanticsLabel: 'A red up arrow'
                ),
              ],
            ),
            Container(
              width: double.infinity,
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(controller.cardNumber.value,
                      textAlign: TextAlign.left,
                      style: TextStyle(

                          color: Colors.white,
                          fontSize: 23,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w800
                      )
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(controller.cardFullName.value,

                          style: TextStyle(
                              color: Colors.white60,
                              fontSize: 17,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500
                          )
                      ),
                      Text(controller.expiryDate.value,

                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 17,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 15)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
  Widget _addCreditCardButton(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.dark_color_3,
          boxShadow: [BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 3.0), //(x,y)
            blurRadius:40.0,
          ),],


          borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: GestureDetector(
        onTap: (){
          controller.changeCardStatus();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(
                   children: [
                     Container(
                       width: 15.0,
                       height: 15.0,
                       decoration: new BoxDecoration(
                         color: controller.cardStatus.value?
                         Colors.yellowAccent:Colors.redAccent,
                         shape: BoxShape.circle,
                       ),
                     ),
                     SizedBox(width: 15,),
                     Text(
                       "Card status:",
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 20,
                             fontFamily: "Poppins",
                             fontWeight: FontWeight.w500
                         )
                     )
                   ],
              ),

            ),
            Text(
                controller.cardStatus.value?"Active":"InActive",
                style: TextStyle(
                    color: controller.cardStatus.value?Colors.yellowAccent:Colors.redAccent,
                    fontSize: 20,
                    fontFamily: "Poppins",

                )
            ),


            //Icon(Icons.add, color: Colors.white, size: 40,)
          ],
        ),
      ),
    );
  }
  Widget _showAccountBalance(Size size){
    return Container(
      width: size.width,
      height: 120,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: size.width/2 - 45,
            decoration: BoxDecoration(
                color: AppColors.dark_color_3,
                boxShadow: [BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 3.0), //(x,y)
                  blurRadius:40.0,
                ),],
                borderRadius: BorderRadius.all(Radius.circular(30))
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Balance",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500
                  )
              ),
              Text(
                  '\$ ${controller.cardBalance.value}',
                  style: TextStyle(
                      color: Colors.lightGreenAccent,
                      fontSize: 25,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w800
                  )
              )
            ],
          ),
          ),
          SizedBox(width: 10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: size.width/2 - 45,
            decoration: BoxDecoration(
                color: AppColors.dark_color_3,
                boxShadow: [BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 3.0), //(x,y)
                  blurRadius:40.0,
                ),],
                borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Cashback",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500
                    )
                ),
                Text(
                    '\$ ${controller.cardCashBack.value}',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 25,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w800
                    )
                )
              ],
            ),
          ),
        ],
      ),
    );

  }


  Widget _showAccountActions(Size size){
    return Container(
      width: size.width,
      height: 120,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: (){
              Get.find<TransfersController>().transferMoneyForm();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: size.width/2 - 45,
              decoration: BoxDecoration(
                  color: AppColors.dark_color_3,
                  boxShadow: [BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 3.0), //(x,y)
                    blurRadius:40.0,
                  ),],
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text(
                      'Transfer',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w800
                      ),

                  ),
                  Icon(Icons.compare_arrows, color: Colors.white, size: 50,)

                ],
              ),
            ),
          ),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: (){
              Get.find<PaymentsController>().payForServiceForm();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: size.width/2 - 45,
              decoration: BoxDecoration(
                  color: AppColors.dark_color_3,
                  boxShadow: [BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 3.0), //(x,y)
                    blurRadius:40.0,
                  ),],
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Payment',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w800
                    ),

                  ),
                  Icon(Icons.add_shopping_cart, color: Colors.white, size: 40,)
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }


}
