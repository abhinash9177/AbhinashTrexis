import 'dart:convert';

List<Contact> contactMapFrom(List<dynamic> data) =>
    List<Contact>.from(data.map((x) => Contact.fromJson(x)));

String contactToJson(List<Contact> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contact {
  String? date;
  String? description;
  double? amount;

  Contact({
    this.date,
    this.description,
    this.amount,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        date: json["date"],
        description: json["description"],
        amount: json["amount"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "description": description,
        "amount": amount,
      };
}
