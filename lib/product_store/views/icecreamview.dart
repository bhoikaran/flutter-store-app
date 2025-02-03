import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/product_store/model/app_state_model.dart';
import 'package:store_app/product_store/widgets/product_item.dart';

class IceCreamView extends StatelessWidget {
  const IceCreamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icecreams'),
      ),
      body: Consumer<AppStateModel>(
        builder: (context, value, child) {
          final products = value.getProducts();
          return ListView.builder(
            itemBuilder: (context, index) {
              return ProductItem(iceCream: products[index]);
            },
            itemCount: products.length,
          );
        },
      ),
    );
  }
}
