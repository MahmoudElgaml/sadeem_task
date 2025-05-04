class AddCartEntity {
  final int? userId;
  final List<AddCartProductEntity>? products;
  
  AddCartEntity({
    this.userId,
    this.products,
  });
  
  // Optional: Create a copy with some properties changed
  AddCartEntity copyWith({
    int? userId,
    List<AddCartProductEntity>? products,
  }) {
    return AddCartEntity(
      userId: userId ?? this.userId,
      products: products ?? this.products,
    );
  }
}

class AddCartProductEntity {
  final int? id;
  final int? quantity;
  
  AddCartProductEntity({
    this.id,
    this.quantity,
  });
  
  // Optional: Create a copy with some properties changed
  AddCartProductEntity copyWith({
    int? id,
    int? quantity,
  }) {
    return AddCartProductEntity(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }
}