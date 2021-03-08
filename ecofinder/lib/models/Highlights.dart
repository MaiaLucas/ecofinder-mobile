class Highlights {
  final String id;
  final String title;
  final String imagesUrl;
  final double rating;

  Highlights({this.id, this.title, this.imagesUrl, this.rating});

  factory Highlights.fromJson(Map<dynamic, dynamic> json) {
    return Highlights(
      id: json['id'],
      title: json['title'],
      imagesUrl: json['images_url'],
      rating: json['rating'],
    );
  }
}
