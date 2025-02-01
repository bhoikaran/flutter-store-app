import 'dart:convert';
import 'package:store_app/product_store/model/product.dart';

// import 'package:store_app/product_store/model/product.dart';

// IcecreamData icecreamDataFromJson(String str) =>
//     IcecreamData.fromJson(json.decode(str) as Map<String, dynamic>);

// String icecreamDataToJson(IcecreamData data) => json.encode(data.toJson());

// class IcecreamData {
//   List<IceCream>? icecreams;

//   IcecreamData({required this.icecreams});

//   factory IcecreamData.fromJson(Map<String, dynamic> json) => IcecreamData(
//         icecreams: (json['icecreams'] as List<dynamic>?)
//             ?.map((x) => IceCream.fromJson(x as Map<String, dynamic>))
//             .toList(),
//       );

//   Map<String, dynamic> toJson() => {
//         'icecreams': icecreams?.map((x) => x.toJson()).toList(),
//       };
// }

// class IceCream  extends Product{
//   int id;
//   String flavor;
//   String category;
//   bool isFeatured;
//   String? description;
//   List<String>? toppings;
//   double price;
//   String? image;
//   List<Ingredient> ingredients;

//   IceCream({
//     required this.id,
//     required this.flavor,
//     required this.category,
//     required this.isFeatured,
//     this.description,
//     this.toppings,
//     required this.price,
//     this.image,
//     required this.ingredients,
//   });

//   factory IceCream.fromJson(Map<String, dynamic> json) => IceCream(
//         id: json['id'] as int,
//         flavor: json['flavor'] as String,
//         category: json['category'] as String,
//         isFeatured: json['isFeatured'] as bool,
//         description: json['description'] as String?,
//         toppings: (json['toppings'] as List<dynamic>?)
//             ?.map((x) => x as String)
//             .toList(),
//         price: (json['price'] as num).toDouble(),
//         image: json['image'] as String?,
//         ingredients: (json['ingredients'] as List<dynamic>)
//             .map((x) => Ingredient.fromJson(x as Map<String, dynamic>))
//             .toList(),
//       );

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'flavor': flavor,
//         'category': category,
//         'isFeatured': isFeatured,
//         'description': description,
//         'toppings': toppings,
//         'price': price,
//         'image': image,
//         'ingredients': ingredients.map((x) => x.toJson()).toList(),
//       };
// }

// class Ingredient {
//   String name;
//   String quantity;

//   Ingredient({required this.name, required this.quantity});

//   factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
//         name: json['name'] as String,
//         quantity: json['quantity'] as String,
//       );

//   Map<String, dynamic> toJson() => {
//         'name': name,
//         'quantity': quantity,
//       };
// }

class IcecreamData {
  IcecreamData({
    required this.icecreams,
  });

  final List<Icecream> icecreams;

  // factory IcecreamData.fromJson(Map<String, dynamic> json) {
  //   return IcecreamData(
  //     icecreams: json["icecreams"] == null
  //         ? []
  //         : List<Icecream>.from(
  //             json['icecreams']!.map((x) => Icecream.fromJson(x)) as List<dynamic>,),
  //   );
  // }

  factory IcecreamData.fromJson(Map<String, dynamic> json) => IcecreamData(
        icecreams: (json['icecreams'] as List<dynamic>?)!
            .map((x) => Icecream.fromJson(x as Map<String, dynamic>))
            .toList(),
      );
}

class Icecream extends Product {
  Icecream({
    required this.id,
    required this.flavor,
    required this.category,
    required this.isFeatured,
    required this.description,
    required this.toppings,
    required this.price,
    required this.image,
    required this.ingredients,
  });

  final int? id;
  final String? flavor;
  final String? category;
  final bool? isFeatured;
  final String? description;
  final List<String> toppings;
  final num? price;
  final String? image;
  final List<Ingredient> ingredients;

  factory Icecream.fromJson(Map<String, dynamic> json) {
    return Icecream(
      id: json['id'] as int?, // Explicit casting
      flavor: json['flavor'] as String,
      category: json['category'] as String,
      isFeatured: json['isFeatured'] as bool,
      description: json['description'] as String?,
      toppings: (json['toppings'] as List?)!.map((e) => e as String).toList(),
      price: (json['price'] as num).toDouble(), // Handle both int and double
      image: json['image'] as String?,
      ingredients: (json['ingredients'] as List)
          .map((x) => Ingredient.fromJson(x as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Ingredient {
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['id'] as String?,
      quantity: json['flavor'] as String?,
    );
  }
  Ingredient({
    required this.name,
    required this.quantity,
  });

  final String? name;
  final String? quantity;
}
