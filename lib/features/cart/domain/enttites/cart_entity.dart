class CartEntity {
  final num? id;
  final List<CartItemEntity>? items;
  final num? total;
  final num? discountedTotal;
  final num? totalProducts;
  final num? totalQuantity;
  
  CartEntity({
    this.id,
    this.items,
    this.total,
    this.discountedTotal,
    this.totalProducts,
    this.totalQuantity,
  });
  
  // Optional: Create a copy of this entity with some properties changed
  CartEntity copyWith({
    num? id,
    List<CartItemEntity>? items,
    num? total,
    num? discountedTotal,
    num? totalProducts,
    num? totalQuantity,
  }) {
    return CartEntity(
      id: id ?? this.id,
      items: items ?? this.items,
      total: total ?? this.total,
      discountedTotal: discountedTotal ?? this.discountedTotal,
      totalProducts: totalProducts ?? this.totalProducts,
      totalQuantity: totalQuantity ?? this.totalQuantity,
    );
  }
}

class CartItemEntity {
  final num? id;
  final String? title;
  final num? price;
  final num? quantity;
  final num? total;
  final num? discountPercentage;
  final num? discountedTotal;
  final String? image;
  
  CartItemEntity({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedTotal,
    this.image,
  });
  
  // Copy with method for CartItemEntity
  CartItemEntity copyWith({
    num? id,
    String? title,
    num? price,
    num? quantity,
    num? total,
    num? discountPercentage,
    num? discountedTotal,
    String? image,
  }) {
    return CartItemEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      discountedTotal: discountedTotal ?? this.discountedTotal,
      image: image ?? this.image,
    );
  }
}

