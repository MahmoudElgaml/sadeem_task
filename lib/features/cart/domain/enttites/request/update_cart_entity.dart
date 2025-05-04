class UpdateCartRequestEntity {
  final bool? merge;
  final List<CartProductRequestEntity>? products;

  UpdateCartRequestEntity({
    this.merge,
    this.products,
  });

  // Optional: Create a copy with some properties changed
  UpdateCartRequestEntity copyWith({
    bool? merge,
    List<CartProductRequestEntity>? products,
  }) {
    return UpdateCartRequestEntity(
      merge: merge ?? this.merge,
      products: products ?? this.products,
    );
  }
}

class CartProductRequestEntity {
  final int? id;
  final int? quantity;

  CartProductRequestEntity({
    this.id,
    this.quantity,
  });

  // Optional: Create a copy with some properties changed
  CartProductRequestEntity copyWith({
    int? id,
    int? quantity,
  }) {
    return CartProductRequestEntity(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }
}