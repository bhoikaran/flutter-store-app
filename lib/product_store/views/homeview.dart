import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:store_app/product_store/model/app_state_model.dart';
import 'package:store_app/product_store/views/cartview.dart';
import 'package:store_app/product_store/views/icecreamview.dart';
import 'package:store_app/product_store/views/searchview.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppStateModel>(context);

    return Scaffold(
      body: SafeArea(
          child: IndexedStack(
        index: model.currentIndex,
        children: const [IceCreamView(), SearchView(), CartView()],
      )),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: model.changeIndex,
        selectedIndex: model.currentIndex,
        destinations: const [
          NavigationDestination(
              icon: Icon(Ionicons.ice_cream_outline), label: 'Icecream'),
          NavigationDestination(
              icon: Icon(Ionicons.search_outline), label: 'Search'),
          NavigationDestination(
              icon: Icon(Ionicons.cart_outline), label: 'Cart'),
        ],
      ),
    );
  }
}
