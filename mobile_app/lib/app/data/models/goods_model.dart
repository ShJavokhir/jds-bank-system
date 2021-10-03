/**
 * Created by IntelliJ IDEA.<br/>
 * User: javokhir<br/>
 * Date: 03/10/21<br/>
 * Time: 10:19<br/>
 */
import 'dart:convert';

class GoodsModel {

  GoodsModel({
    required this.id,
    required this.cardNumber,
    required this.amount,
    required this.goodsName,
    required this.goodsAccountNumber,
    required this.time,
  });

  late int id;
  late String cardNumber;
  late num amount;
  late String goodsName;
  late String goodsAccountNumber;
  late DateTime time;

  factory GoodsModel.fromJson(Map<String, dynamic> json) => GoodsModel(
    id: json["id"],
    cardNumber: json["cardNumber"],
    amount: json["amount"],
    goodsName: json["goodsName"],
    goodsAccountNumber: json["goodsAccountNumber"],
    time: DateTime.parse(json["time"]),
  );

  Map<String, dynamic> toJson() => {

    "id": id,
    "cardNumber": cardNumber,
    "amount": amount,
    "goodsName": goodsName,
    "goodsAccountNumber": goodsAccountNumber,
    "time": time.toIso8601String(),
  };
}

