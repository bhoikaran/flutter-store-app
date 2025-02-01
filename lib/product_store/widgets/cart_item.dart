import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:store_app/product_store/model/app_state_model.dart';
import 'package:store_app/product_store/model/icecream.dart';
import 'package:store_app/themes/styles.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    required this.product,
    required this.quantity,
    super.key,
  });

  final Icecream product;

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(product.image!),
        ),
        title: Text(
          product.flavor!,
          style: Styles.prodctRowItemName,
        ),
        subtitle: Text(
          '${quantity > 1 ? '$quantity x' : ''} ₹ ${product.price}',
          style: Styles.prodctRowItemPrice,
        ),
        trailing: Text(
          '₹${product.price! * quantity}',
          style: Styles.prodctRowItemName,
        ),
      ),
    );
  }
}
