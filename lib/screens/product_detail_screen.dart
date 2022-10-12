import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  final String title;

  static const routeName = '/product-detail-screen';

  const ProductDetailScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = Get.arguments['id'] as String;
    final String productTitle = Get.arguments['title'] as String;

    return Scaffold(
      appBar: AppBar(title: Text(productTitle)),
    );
  }
}
