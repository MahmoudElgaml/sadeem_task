class ProductsEntity {
  final List<ProductEntity>? products;

  ProductsEntity({this.products});
}

class ProductEntity {
  final int? id;
  final String? title;
  final String? description;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final int? weight;
  final String? availabilityStatus;
  final List<ReviewEntity>? reviews;
  final List<String>? images;
  final String? thumbnail;

  ProductEntity({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.weight,
    this.availabilityStatus,
    this.reviews,
    this.images,
    this.thumbnail,
  });
  double? get priceAfterDiscount {
    if (price == null || discountPercentage == null) return price;

    double discountAmount = price! * (discountPercentage! / 100);
    return price! - discountAmount;
  }

  // Format the price with two decimal places
  String get formattedPrice {
    return price != null ? '\$${price!.toStringAsFixed(2)}' : 'N/A';
  }

  // Format the discounted price with two decimal places
  String get formattedDiscountedPrice {
    return priceAfterDiscount != null
        ? '\$${priceAfterDiscount!.toStringAsFixed(2)}'
        : 'N/A';
  }

  bool get isAvailable {
    return availabilityStatus == "In Stock" && stock != null && stock! > 0;
  }
}

class ReviewEntity {
  final int? rating;
  final String? comment;
  final String? date;
  final String? reviewerName;
  final String? reviewerEmail;

  ReviewEntity({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });
}
