class UpdateCartRequestDto {
  final bool? merge;
  final List<CartProductRequestDto>? products;

  UpdateCartRequestDto({
    this.merge,
    this.products,
  });

  // Convert the request to JSON
  Map<String, dynamic> toJson() {
    return {
      'merge': merge,
      'products': products?.map((product) => product.toJson()).toList(),
    };
  }

  // Create a request instance from JSON
  factory UpdateCartRequestDto.fromJson(Map<String, dynamic> json) {
    return UpdateCartRequestDto(
      merge: json['merge'] as bool?,
      products: json['products'] != null
          ? List<CartProductRequestDto>.from(
              json['products'].map((x) => CartProductRequestDto.fromJson(x)))
          : null,
    );
  }
}

class CartProductRequestDto {
  final int? id;
  final int? quantity;

  CartProductRequestDto({
    this.id,
    this.quantity,
  });

  // Convert the product request to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }

  // Create a product request instance from JSON
  factory CartProductRequestDto.fromJson(Map<String, dynamic> json) {
    return CartProductRequestDto(
      id: json['id'] as int?,
      quantity: json['quantity'] as int?,
    );
  }
}