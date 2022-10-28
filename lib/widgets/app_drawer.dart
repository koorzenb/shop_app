import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/user_products_green.dart';
import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(OrdersScreen.routename),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Your products'),
            onTap: () => Navigator.of(context)
                .pushReplacementNamed(UserProductsScreen.routename),
          ),
        ],
      ),
    );
  }
}
