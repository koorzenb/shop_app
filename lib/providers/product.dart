import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavourite = false,
  });

  _setFavValue(newValue) {
    isFavourite = newValue;
    notifyListeners();
  }

  toggleFavouriteStatus() async {
    final oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    final url = Uri.https('shop-app-4c7e3-default-rtdb.firebaseio.com', '/products/$id.json');
    try {
      final response = await http.patch(url, body: jsonEncode({'isFavourite': isFavourite}));
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      _setFavValue(oldStatus);
    }
  }
}
