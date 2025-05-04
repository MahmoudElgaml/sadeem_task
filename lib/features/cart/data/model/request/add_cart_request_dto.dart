class AddCartRequestDto {
  final int? userId;
  final List<AddCartProductDto>? products;
  
  AddCartRequestDto({
    this.userId,
    this.products,
  });
  
  // Convert to JSON for API requests
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'products': products?.map((product) => product.toJson()).toList(),
    };
  }
  
  // Create from JSON (useful for testing or persistence)
  factory AddCartRequestDto.fromJson(Map<String, dynamic> json) {
    return AddCartRequestDto(
      userId: json['userId'],
      products: json['products'] != null 
          ? List<AddCartProductDto>.from(
              json['products'].map((x) => AddCartProductDto.fromJson(x)))
          : null,
    );
  }
}

class AddCartProductDto {
  final int? id;
  final int? quantity;
  
  AddCartProductDto({
    this.id,
    this.quantity,
  });
  
  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
    };
  }
  
  // Create from JSON
  factory AddCartProductDto.fromJson(Map<String, dynamic> json) {
    return AddCartProductDto(
      id: json['id'],
      quantity: json['quantity'],
    );
  }
}