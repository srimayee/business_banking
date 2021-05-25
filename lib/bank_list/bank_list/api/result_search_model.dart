import 'dart:convert';

import 'package:app_interview/features_bank/bank_list/model/result_search.dart';

class ResultSearchModel extends ResultSearch {
  ResultSearchModel(
      {String name,
      String email,
      String phone,
      String street,
      String suite,
      String city,
      String zipcode})
      : super(name, email, phone, street, suite, city, zipcode);

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'phone': phone};
  }

  static ResultSearchModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultSearchModel(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      street: map['address']['street'],
      suite: map['address']['suite'],
      city: map['address']['city'],
      zipcode: map['address']['zipcode'],
    );
  }

  String toJson() => json.encode(toMap());

  static ResultSearchModel fromJson(String source) =>
      fromMap(json.decode(source));
}
