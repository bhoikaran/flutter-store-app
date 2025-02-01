import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:store_app/product_store/model/icecream.dart';

class ProductRepo {
  static Future<List<Icecream>> loadAllIcecreams() async {
    // final res = await rootBundle.loadString('assets/icecream.json');
    final res = await rootBundle.loadString('assets/icecream.json');

    final iceCreamData =
        IcecreamData.fromJson(jsonDecode(res) as Map<String, dynamic>);
    return iceCreamData.icecreams!;
  }
}
