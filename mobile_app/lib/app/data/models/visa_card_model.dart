/**
 * Created by IntelliJ IDEA.<br/>
 * User: javokhir<br/>
 * Date: 03/10/21<br/>
 * Time: 07:32<br/>
 */

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class VisaCardModel {

  VisaCardModel({
    required this.cardExpiryDate,
    required this.cardNumber,
    required this.cardCvv,
    required this.isVirtual,
    required this.isActive,
    required this.balance,
    required this.cashBack,
    required this.fullName,
    required this.id,
  });

  late String cardExpiryDate;
  late String cardNumber;
  late String cardCvv;
  late bool isVirtual;
  late bool isActive;
  late int balance;
  late int cashBack;
  late String fullName;
  late int id;

  factory VisaCardModel.fromJson(Map<String, dynamic> json) => VisaCardModel(
    cardExpiryDate: json["cardExpiryDate"],
    cardNumber: json["cardNumber"],
    cardCvv: json["cardCvv"],
    isVirtual: json["isVirtual"],
    isActive: json["isActive"],
    balance: json["balance"],
    cashBack: json["cashBack"],
    fullName: json["fullName"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "cardExpiryDate": cardExpiryDate,
    "cardNumber": cardNumber,
    "cardCvv": cardCvv,
    "isVirtual": isVirtual,
    "isActive": isActive,
    "balance": balance,
    "cashBack": cashBack,
    "fullName": fullName,
    "id": id,
  };
}
