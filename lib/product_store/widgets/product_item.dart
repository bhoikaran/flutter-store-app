import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:store_app/product_store/model/app_state_model.dart';
import 'package:store_app/product_store/model/icecream.dart';
import 'package:store_app/themes/styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.iceCream});

  final Icecream iceCream;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(iceCream.image!),
      ),
      title: Text(
        iceCream.flavor!,
        style: Styles.prodctRowItemName,
      ),
      subtitle: Text(
        '₹ ${iceCream.price}',
        style: Styles.prodctRowItemPrice,
      ),
      trailing: IconButton(
        onPressed: () {
        Provider.of<AppStateModel>(context, listen: false)
            .addProductToCart(iceCream.id!);
        },
        icon: const Icon(Ionicons.add_circle_outline),
      ),
    );
  }
}
