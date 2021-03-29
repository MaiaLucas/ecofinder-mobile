class Place {
  final String id;
  final String title;
  final String description;
  final String address;
  final String city;
  final String phone;
  final bool openOnWeekend;
  final String hrInit;
  final String hrFinal;
  final Map<String, dynamic> imagesUrl;
  final double rating;

  Place({
    this.id,
    this.title,
    this.description,
    this.imagesUrl,
    this.rating,
    this.hrInit,
    this.hrFinal,
    this.address,
    this.city,
    this.phone,
    this.openOnWeekend,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      title: json['title'],
      imagesUrl: json['imagesUrl'],
      description: json['description'],
      address: json['address'],
      city: json['city'],
      phone: json['phone'],
      openOnWeekend: json['open_on_weekend'],
      hrInit: json['hr_init'],
      hrFinal: json['hr_final'],
      rating: json['rating'].toDouble(),
    );
  }
}
