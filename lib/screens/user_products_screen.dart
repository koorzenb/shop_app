import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';
import 'edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static String routeName = '/user-products-screen';

  const UserProductsScreen({Key key}) : super(key: key);

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts(true);
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
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: ((context, snapshot) => snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: (() => _refreshProducts(context)),
                child: Consumer<Products>(
                  builder: ((ctx, productsData, _) => Padding(
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
                        ),
                      )),
                ),
              )),
      ),
    );
  }
}
