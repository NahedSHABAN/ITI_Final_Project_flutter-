// To parse this JSON data, do
//
//     final cartProducts = cartProductsFromJson(jsonString);

import 'dart:convert';

CartProducts cartProductsFromJson(String str) => CartProducts.fromJson(json.decode(str));

String cartProductsToJson(CartProducts data) => json.encode(data.toJson());

class CartProducts {
  ProductCart product;
  int quantity;

  CartProducts({
    required this.product,
    required this.quantity,
  });

  factory CartProducts.fromJson(Map<String, dynamic> json) => CartProducts(
    product: ProductCart.fromJson(json["product"]),
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "product": product.toJson(),
    "quantity": quantity,
  };
}

class ProductCart{
  int quantityInStock;
  String images;
  int price;
  String id;
  String title;

  ProductCart({
    required this.quantityInStock,
    required this.images,
    required this.price,
    required this.id,
    required this.title,
  });

  factory ProductCart.fromJson(Map<String, dynamic> json) => ProductCart(
    quantityInStock: json["quantityInStock"],
    images: json["images"],
    price: json["price"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "quantityInStock": quantityInStock,
    "images": images,
    "price": price,
    "id": id,
    "title": title,
  };
}
