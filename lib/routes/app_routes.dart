import 'package:get/get.dart';

import '../screens/product_detail_screen.dart';
import '../screens/products_overview_screen.dart';

appRoutes() => [
      GetPage(
        name: '/home',
        page: () => ProductsOverviewScreen(),
        transition: Transition.zoom,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/product-detail-screen',
        page: () => ProductDetailScreen(),
        transition: Transition.zoom,
        transitionDuration: Duration(milliseconds: 500),
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage onPageCalled(GetPage page) {
    print(page.name);
    return super.onPageCalled(page);
  }
}
