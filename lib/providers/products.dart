import 'package:get/get.dart';

import '../models/product.dart';

// class Products with ChangeNotifier {
//   List<Product> _items = [];

//   List<Product> get items {
//     return [...items];
//   }

//   void addProducts() {
//     notifyListeners();
//   }
// }

class ProductsListController extends GetxController {
  static ProductsListController get getOrPut {
    try {
      return Get.find<ProductsListController>();
    } catch (e) {
      return Get.put(ProductsListController.create());
    }
  }

  final List<Product> products = [];

  ProductsListController();

  static ProductsListController create() {
    return ProductsListController();
  }

  Future<void> addProduct(Product product) async {
    products.add(product);
    update();
  }
}
