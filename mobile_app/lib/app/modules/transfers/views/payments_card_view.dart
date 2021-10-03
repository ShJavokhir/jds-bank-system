import 'package:flutter/material.dart';
import 'package:mobile_app/app/data/colors.dart';
/**
 * Created by IntelliJ IDEA.<br/>
 * User: javokhir<br/>
 * Date: 03/10/21<br/>
 * Time: 00:39<br/>
 */
class PaymentsCardView extends StatelessWidget {
  final String serviceName;
  final num amount;
  final IconData icon;
  const PaymentsCardView({required this.serviceName, required this.amount, required this.icon});

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white60, size: 40,),
              SizedBox(width: 20,),
              Text(serviceName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),

          Text('-$amount \$',
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600
              )
          )
        ],
      ),
    );
  }
}
