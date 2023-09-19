import 'dart:convert';

Home homeMapFrom(String str) => Home.fromJson(json.decode(str));

String homeToJson(Home data) => json.encode(data.toJson());

class Home {
  String? name;
  String? accountNumber;
  double? balance;
  String? currency;
  Address? address;
  List<RecentTransaction>? recentTransactions;
  List<RecentTransaction>? upcomingBills;

  Home({
    this.name,
    this.accountNumber,
    this.balance,
    this.currency,
    this.address,
    this.recentTransactions,
    this.upcomingBills,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        name: json["name"],
        accountNumber: json["accountNumber"],
        balance: json["balance"]?.toDouble(),
        currency: json["currency"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        recentTransactions: json["recentTransactions"] == null
            ? []
            : List<RecentTransaction>.from(json["recentTransactions"]!
                .map((x) => RecentTransaction.fromJson(x))),
        upcomingBills: json["upcomingBills"] == null
            ? []
            : List<RecentTransaction>.from(json["upcomingBills"]!
                .map((x) => RecentTransaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "accountNumber": accountNumber,
        "balance": balance,
        "currency": currency,
        "address": address?.toJson(),
        "recentTransactions": recentTransactions == null
            ? []
            : List<dynamic>.from(recentTransactions!.map((x) => x.toJson())),
        "upcomingBills": upcomingBills == null
            ? []
            : List<dynamic>.from(upcomingBills!.map((x) => x.toJson())),
      };
}

class Address {
  String? streetName;
  String? buildingNumber;
  String? townName;
  String? postCode;
  String? country;

  Address({
    this.streetName,
    this.buildingNumber,
    this.townName,
    this.postCode,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        streetName: json["streetName"],
        buildingNumber: json["buildingNumber"],
        townName: json["townName"],
        postCode: json["postCode"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "streetName": streetName,
        "buildingNumber": buildingNumber,
        "townName": townName,
        "postCode": postCode,
        "country": country,
      };
}

class RecentTransaction {
  String? date;
  String? description;
  double? amount;
  String? fromAccount;
  String? toAccount;

  RecentTransaction({
    this.date,
    this.description,
    this.amount,
    this.fromAccount,
    this.toAccount,
  });

  factory RecentTransaction.fromJson(Map<String, dynamic> json) =>
      RecentTransaction(
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
