class Article {
  final String title;
  final String description;
  final String urlToImage;
  final num price;
  final String category;

  Article({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.price,
    required this.category,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] as String,
      description: json['description'] as String,
      urlToImage: json['urlToImage'] as String,
      price: json['price'] as num,
      category: json['category'] as String,
    );
  }
}

