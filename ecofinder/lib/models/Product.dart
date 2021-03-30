import 'dart:convert';

class Product {
  final int id;
  final String title;
  final String instagramAccount;
  final String facebookLink;
  final double rating;
  final Map<String, dynamic> imagesUrl;

  Product({
    this.id,
    this.title,
    this.instagramAccount,
    this.facebookLink,
    this.rating,
    this.imagesUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      instagramAccount: json['instagram_account'],
      facebookLink: json['facebook_link'],
      rating: json['rating'].toDouble(),
      imagesUrl: jsonDecode(json['images_url']),
    );
  }
}
