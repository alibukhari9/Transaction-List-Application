import 'dart:convert';

import 'package:assignment_app/services/models.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class TransactionProviders extends ChangeNotifier {
  List<Transaction>? transactionList = [];

  Future<void> loadTransactions() async {
    final response = await http.get(Uri.parse(
        'https://60e29b749103bd0017b4743f.mockapi.io/api/v1/transactions'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(json.decode(response.body));
      transactionList = (json.decode(response.body) as List)
          .map((e) => Transaction.fromMap(e))
          .toList();
      notifyListeners();
      return;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
