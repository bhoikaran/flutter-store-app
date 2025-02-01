import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:store_app/product_store/model/app_state_model.dart';
import 'package:store_app/product_store/widgets/cart_item.dart';
import 'package:store_app/themes/styles.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  String? name;
  String? email;
  String? address;
  String? pin;
  String? mobile;
  DateTime? dateTime = DateTime.now();
  final formKey = GlobalKey<FormState>();
  Widget _buildName() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Name',
        prefixIcon: Icon(Icons.person_2_outlined),
      ),
      keyboardType: TextInputType.name,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onChanged: (value) => setState(() => name = value),
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      // ignore: lines_longer_than_80_chars
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email Address',
        prefixIcon: Icon(Icons.email_outlined),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email adress';
        }
        return null;
      },
      onChanged: (value) => setState(() => email = value),
    );
  }

  Widget _buildMobile() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Mobil Number',
        prefixIcon: Icon(Icons.call_outlined),
      ),
      keyboardType: TextInputType.phone,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Mobil is Required';
        }
        return null;
      },
      onChanged: (value) => setState(() => mobile = value),
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Address',
        prefixIcon: Icon(Icons.location_on_outlined),
      ),
      keyboardType: TextInputType.streetAddress,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Address is Required';
        }
        return null;
      },
      onChanged: (value) => setState(() => address = value),
    );
  }

  Widget _buildTimePicker() {
    return InkWell(
      onTap: () async {
        final newTime = await showDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );
        if (newTime != null) {
          setState(() {
            dateTime = newTime;
          });
        }
      },
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Row(
                children: <Widget>[
                  Icon(Ionicons.time_outline),
                  SizedBox(width: 6),
                  Text(
                    'Delevery Time',
                    style: Styles.deliveryTime,
                  ),
                ],
              ),
              Text(
                DateFormat.yMMMd().add_jm().format(dateTime ?? DateTime.now()),
                style: Styles.deliveryTime,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<AppStateModel>(
        builder: (context, value, child) {
          return ListView(
            children: [
              ExpansionTile(
                title: const Text('Address Details'),
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: _buildName(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: _buildEmail(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: _buildMobile(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: _buildAddress(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: _buildTimePicker(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              if (value.productInCart.isNotEmpty) ...[
                ListView.builder(
                  itemBuilder: (context, index) {
                    return CartItem(
                      product: value.getProductById(
                        value.productInCart.keys.toList()[index],
                      ),
                      quantity: value.productInCart.values.toList()[index],
                    );
                  },
                  itemCount: value.productInCart.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Shipping + Tex',
                        style: Styles.prodctRowItemPrice,
                      ),
                      Text(
                        '₹ ${value.shippingCost} + ${value.tax}',
                        style: Styles.prodctRowItemPrice,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total', style: Styles.prodctRowItemName),
                      Text(
                        '₹ ${value.totalCost}',
                        style: Styles.prodctRowItemName,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      value.clearCart();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Order Placed Succesfully'),
                        ),
                      );
                    }
                  },
                  child: const Text('Place Order'),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
