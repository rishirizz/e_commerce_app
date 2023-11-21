class Product {
  final String name;
  final double price;
  final String description;
  final String image;
  int quantity;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    this.quantity = 0,
  });
}
