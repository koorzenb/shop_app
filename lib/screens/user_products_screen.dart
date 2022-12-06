import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'edit_product_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static String routeName = '/user-products-screen';

  const UserProductsScreen({Key key}) : super(key: key);

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Products'),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed(EditProductScreen.routeName),
              icon: Icon(Icons.add),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: RefreshIndicator(
          onRefresh: (() => _refreshProducts(context)),
          child: Padding(
              padding: EdgeInsets.all(8),
              child: ListView.builder(
                itemBuilder: ((context, i) => Column(
                      children: [
                        UserProductItem(
                          productData.items[i].id,
                          productData.items[i].title,
                          productData.items[i].imageUrl,
                        ),
                        Divider(),
                      ],
                    )),
                itemCount: productData.items.length,
              )),
        ));
  }
}
