import 'dart:convert';

class Product {
  final int id;
  final String title;
  final String instagramAccount;
  final String facebookLink;
  final String description;
  final double rating;
  final double price;
  final Map<String, dynamic> imagesUrl;

  Product({
    this.id,
    this.title,
    this.instagramAccount,
    this.facebookLink,
    this.description,
    this.rating,
    this.price,
    this.imagesUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      instagramAccount: json['instagram'],
      facebookLink: json['fbLink'],
      rating: json['rating'].toDouble(),
      price: json['price'].toDouble(),
      imagesUrl: jsonDecode(json['imagesUrl']),
    );
  }
}
