class Product {
  String? brand;
  String? description;
  String? title;
  List<String>? images;
  int? price;
  String? proId;
  int? quantityInStock;
  int? rating;
  int? ratingQuantity;
  String? sku;
  String? subCategoryId;
  String? thumbnail;
  int?discountPercentage;

  Product({
    this.brand,
    this.description,
    this.title,
    this.images,
    this.price,
    this.proId,
    this.quantityInStock,
    this.rating,
    this.ratingQuantity,
    this.sku,
    this.subCategoryId,
    this.thumbnail,
    this.discountPercentage
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      brand: json['brand'],
      description: json['description'],
      title: json['title'],
      images: List<String>.from(json['images']),
      price: json['price'],
      proId: json['proId'],
      quantityInStock: json['quantityInStock'],
      rating: json['rating'],
      ratingQuantity: json['ratingQuantity'],
      sku: json['sku'],
      subCategoryId: json['subCategoryId'],
      thumbnail: json['thumbnail'],
        discountPercentage: json['discountPercentage']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'description': description,
      'title': title,
      'images': images,
      'price': price,
      'proId': proId,
      'quantityInStock': quantityInStock,
      'rating': rating,
      'ratingQuantity': ratingQuantity,
      'sku': sku,
      'subCategoryId': subCategoryId,
      'thumbnail': thumbnail,
      'discountPercentage':discountPercentage,
    };
  }
}

