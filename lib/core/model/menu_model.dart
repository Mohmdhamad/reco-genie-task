class MenuModel {
  final int id;
  final String name;
  final String imageUrl;
  final int price;
  final double rating;

  MenuModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image'],
      price: json['caloriesPerServing'],
      rating: json['rating'],
    );
  }
}
