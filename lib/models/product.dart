class Product {
  final String name;
  final String description;
  final String coverImage;
  final int? salePercentage;
  final int price;
  final int stock;
  final List<String> sizes;
  final List<String> images = [];

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.coverImage,
    this.salePercentage,
    this.sizes = const [],
  });
}
