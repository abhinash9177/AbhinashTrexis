import 'dart:convert';

List<Account> accountMapFrom(List<dynamic> data) =>
    List<Account>.from(data.map((x) => Account.fromJson(x)));

String accountMapTo(List<Account> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Account {
  String? id;
  String? accountNumber;
  String? accountType;
  double? balance;
  String? accountHolder;

  Account({
    this.id,
    this.accountNumber,
    this.accountType,
    this.balance,
    this.accountHolder,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"] ?? 'NA',
        accountNumber: json["accountNumber"] ?? 'NA',
        accountType: json["accountType"] ?? 'NA',
        balance: json["balance"]?.toDouble() ?? 0.0,
        accountHolder: json["accountHolder"] ?? 'NA',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "accountNumber": accountNumber,
        "accountType": accountType,
        "balance": balance,
        "accountHolder": accountHolder,
      };
}
