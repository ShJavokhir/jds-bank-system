import 'package:flutter/material.dart';
import 'package:mobile_app/app/data/colors.dart';
/**
 * Created by IntelliJ IDEA.<br/>
 * User: javokhir<br/>
 * Date: 03/10/21<br/>
 * Time: 00:17<br/>
 */

class MoneyTransferCard extends StatelessWidget {
  final String cardNumber;
  final num amount;
  const MoneyTransferCard({required this.cardNumber, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
    width: double.infinity,
    height: 100,
    decoration: BoxDecoration(
    color: AppColors.dark_color_3,
    boxShadow: [BoxShadow(
    color: Colors.black26,
    offset: Offset(0.0, 3.0), //(x,y)
    blurRadius:40.0,
    ),],


    borderRadius: BorderRadius.all(Radius.circular(20))
    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(amount>=0?Icons.arrow_circle_up_outlined:Icons.arrow_circle_down_outlined, color: amount>=0? Colors.lightGreenAccent:Colors.redAccent, size: 60,),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(cardNumber,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600
                  ),
          ),
                  SizedBox(height: 5,),
                  Text('$amount \$',
                      style: TextStyle(
                          color: amount>=0? Colors.lightGreenAccent:Colors.redAccent,
                          fontSize: 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600
                      )
                  )

            ],
          )
        ],
      ),
    );
  }
}
