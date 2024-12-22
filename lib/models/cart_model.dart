class CartItem {
  final dynamic product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class Article {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  Article({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as double,
      imageUrl: json['imageUrl'] as String,
      category: json['category'] as String,
    );
  }

  String get princeInEuros => '\$${price.toStringAsFixed(2)}';
}