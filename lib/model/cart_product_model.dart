class CartProductModel {
  late String name, image, price;
  late int quantity;

  CartProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
    };
  }
}
