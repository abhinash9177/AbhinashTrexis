import 'dart:convert';

List<Transaction> transactionMapFrom(List<dynamic> data) =>
    List<Transaction>.from(data.map((x) => Transaction.fromJson(x)));

String transactionToJson(List<Transaction> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transaction {
  String? date;
  String? description;
  double? amount;
  String? fromAccount;
  String? toAccount;

  Transaction({
    this.date,
    this.description,
    this.amount,
    this.fromAccount,
    this.toAccount,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        date: json["date"],
        description: json["description"],
        amount: json["amount"]?.toDouble(),
        fromAccount: json["fromAccount"],
        toAccount: json["toAccount"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "description": description,
        "amount": amount,
        "fromAccount": fromAccount,
        "toAccount": toAccount,
      };
}
