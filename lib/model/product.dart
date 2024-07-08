class Product {
  final int id;
  final String name;
  final int quantity;
  final double unitPrice;

  Product({required this.id, required this.name, required this.quantity, required this.unitPrice});

  factory Product.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    final quantity = json['quantity'];
    final unitPrice = json['unitPrice'];
    return Product(id: id, name: name, quantity: quantity, unitPrice: unitPrice);
  }
}