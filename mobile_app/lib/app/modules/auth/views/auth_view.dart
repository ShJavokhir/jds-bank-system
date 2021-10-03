import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_app/app/data/colors.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        width: double.infinity,
        height: double.infinity,
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
        child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: 50,),
              Text(
                  "Auth",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600
                  )
              ),
              SizedBox(height: 35),
              Obx(
                      () => controller.isLoginState.value?_getLoginForm():_getRegisterForm()
              ),
              //controller.isLoginState.value?_getLoginForm():_getRegisterForm()
            ]
        ),
      ),

    );
  }

  Widget _getLoginForm(){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10,2,10,2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.white)
          ),
          child: TextField(
            style: TextStyle(color: Colors.white),
            onChanged: (txt){
              controller.cardNumber.value = txt;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Card Number",
              labelStyle: TextStyle(color: Colors.white),
              fillColor: Colors.white,
              focusColor: Colors.white,
              hoverColor: Colors.white,

            ),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          width: Get.width-60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(

                padding: EdgeInsets.fromLTRB(10,2,10,2),
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.white)
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (txt){
                    controller.cardCvv.value = txt;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "CVV",
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white,

                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10,2,10,2),
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.white)
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (txt){
                    controller.cardExpiryDate.value = txt;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Expiry Date",
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white,

                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 35,),
        Container(
          decoration: BoxDecoration(
              color: Colors.lightGreenAccent,
              boxShadow: [BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 3.0), //(x,y)
                blurRadius:40.0,
              ),],
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          width: double.infinity,
          child: FlatButton(
            onPressed: (){
              controller.loginToVisa();
            },
            child: Text("Log In",
                style: TextStyle(
                    color: AppColors.dark_color_1,
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600
                )
            ),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              boxShadow: [BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 3.0), //(x,y)
                blurRadius:40.0,
              ),],
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          width: double.infinity,
          child: FlatButton(
            onPressed: (){
              controller.isLoginState.value = false;
            },
            child: Text("Or create new  one",
                style: TextStyle(
                    color: AppColors.dark_color_1,
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600
                )
            ),
          ),
        )],
    );
  }

  Widget _getRegisterForm(){
    return Column(
      children: [
        Container(
        padding: EdgeInsets.fromLTRB(10,2,10,2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white)
        ),
        child: TextField(
          style: TextStyle(color: Colors.white),
          onChanged: (txt){
            controller.fullName.value = txt;
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "Full Name",
            labelStyle: TextStyle(color: Colors.white),
            fillColor: Colors.white,
            focusColor: Colors.white,
            hoverColor: Colors.white,

          ),
        ),
      ),
        SizedBox(height: 35,),
        Container(
          decoration: BoxDecoration(
              color: Colors.lightGreenAccent,
              boxShadow: [BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 3.0), //(x,y)
                blurRadius:40.0,
              ),],
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          width: double.infinity,
          child: FlatButton(
            onPressed: (){
              controller.createNewVisa();
            },
            child: Text("Create new Virtual Visa",
                style: TextStyle(
                    color: AppColors.dark_color_1,
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600
                )
            ),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              boxShadow: [BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 3.0), //(x,y)
                blurRadius:40.0,
              ),],
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          width: double.infinity,
          child: FlatButton(
            onPressed: (){
              controller.isLoginState.value = true;
            },
            child: Text("Or login exsisting one",
                style: TextStyle(
                    color: AppColors.dark_color_1,
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600
                )
            ),
          ),
        )],
    );
  }
}
