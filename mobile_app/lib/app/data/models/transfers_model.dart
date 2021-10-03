/**
 * Created by IntelliJ IDEA.<br/>
 * User: javokhir<br/>
 * Date: 03/10/21<br/>
 * Time: 10:01<br/>
    "id": 1,
    "cardReceived": "5727758689945215",
    "cardSent": "3189662477963493",
    "amount": 250,
    "time": "2021-10-02T08:02:01.000Z"
 */

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

class TransfersModel {

  TransfersModel({
    required this.id,
    required this.cardReceived,
    required this.cardSent,
    required this.amount,
    required this.time,
  });

  late String cardReceived;
  late String cardSent;
  late num amount;
  late DateTime time;
  late int id;

  factory TransfersModel.fromJson(Map<String, dynamic> json) => TransfersModel(
    id: json["id"],
    cardReceived: json["cardReceived"],
    cardSent: json["cardSent"],
    amount: json["amount"],
    time: DateTime.parse(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cardReceived": cardReceived,
    "cardSent": cardSent,
    "amount": amount,
    "time": time.toIso8601String(),
  };
}

