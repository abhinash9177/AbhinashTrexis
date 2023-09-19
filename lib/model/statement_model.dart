import 'dart:convert';

List<Statement> statementMapFrom(List<dynamic> data) =>
    List<Statement>.from(data.map((x) => Statement.fromJson(x)));

String statementToJson(List<Statement> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Statement {
  String? date;
  String? description;
  double? amount;

  Statement({
    this.date,
    this.description,
    this.amount,
  });

  factory Statement.fromJson(Map<String, dynamic> json) => Statement(
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
