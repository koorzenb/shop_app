import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/cart_item.dart';
import '../providers/cart.dart' show Cart;
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart';

  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      Chip(
                        label: Text(
                          '\$${cart.totalAmount}',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      TextButton(onPressed: () {}, child: Text('Order Now'))
                    ]),
              )),
          SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, i) => CartItem(
              cart.items[i].id,
              cart.items[i].price,
              cart.items[i].quantity,
              cart.items[i].title,
            ),
            itemCount: cart.itemCount,
          ))
        ],
      ),
    );
  }
}
