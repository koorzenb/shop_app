import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import 'package:flutter_complete_guide/screens/edit_product_screen.dart';
import 'package:flutter_complete_guide/widgets/app_drawer.dart';
import 'package:flutter_complete_guide/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  static String routename = '/user-products-screen';

  const UserProductsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Products'),
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(EditProductScreen.routename),
              icon: Icon(Icons.add),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: Padding(
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
            )));
  }
}
