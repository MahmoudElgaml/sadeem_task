class CartDto {
  final List<Cart>? carts;
  final num? total;
  final num? skip;
  final num? limit;

  CartDto({
    this.carts,
    this.total,
    this.skip,
    this.limit,
  });

  factory CartDto.fromJson(Map<String, dynamic> json) {
    return CartDto(
      carts: json['carts'] != null
          ? List<Cart>.from(json['carts'].map((x) => Cart.fromJson(x)))
          : null,
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'carts': carts?.map((x) => x.toJson()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}

class Cart {
  final num? id;
  final List<CartProduct>? products;
  final num? total;
  final num? discountedTotal;
  final num? userId;
  final num? totalProducts;
  final num? totalQuantity;

  Cart({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      products: json['products'] != null
          ? List<CartProduct>.from(json['products'].map((x) => CartProduct.fromJson(x)))
          : null,
      total: json['total'],
      discountedTotal: json['discountedTotal'],
      userId: json['userId'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products': products?.map((x) => x.toJson()).toList(),
      'total': total,
      'discountedTotal': discountedTotal,
      'userId': userId,
      'totalProducts': totalProducts,
      'totalQuantity': totalQuantity,
    };
  }
}

class CartProduct {
  final num? id;
  final String? title;
  final double? price;
  final num? quantity;
  final double? total;
  final double? discountPercentage;
  final double? discountedTotal;
  final String? thumbnail;

  CartProduct({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedTotal,
    this.thumbnail,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'],
      title: json['title'],
      price: json['price']?.toDouble(),
      quantity: json['quantity'],
      total: json['total']?.toDouble(),
      discountPercentage: json['discountPercentage']?.toDouble(),
      discountedTotal: json['discountedTotal']?.toDouble(),
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
      'total': total,
      'discountPercentage': discountPercentage,
      'discountedTotal': discountedTotal,
      'thumbnail': thumbnail,
    };
  }
}