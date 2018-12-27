import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_unit_converter/constants.dart';

class RatesResponse {
  Map<String, double> rates;
  String base;
  String date;

  RatesResponse({
    this.rates,
    this.base = '',
    this.date = '',
  });

  factory RatesResponse.fromJson(Map<String, dynamic> json) {
    Map<String, double> rates = new Map<String, double>();

    for (String key in json['rates'].keys) {
      rates[key] = json['rates'][key];
    }

    return RatesResponse(
      rates: rates,
      base: json['base'],
      date: json['date'],
    );
  }
}

Future<RatesResponse> getRates(String from) async {
  final response = await http.get('$currencyApiUrl?base=$from');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    return RatesResponse.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to get currenty rates');
  }
}