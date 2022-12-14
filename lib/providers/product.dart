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

  toggleFavouriteStatus(String token, String userId) async {
    final oldStatus = isFavourite;
    isFavourite = !isFavourite;
    notifyListeners();
    final _params = {'auth': token};
    final url = Uri.https('shop-app-4c7e3-default-rtdb.firebaseio.com', '/userFavourites/$userId/$id.json', _params);
    try {
      final response = await http.put(url,
          body: jsonEncode(
            isFavourite,
          ));
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      _setFavValue(oldStatus);
    }
  }
}
