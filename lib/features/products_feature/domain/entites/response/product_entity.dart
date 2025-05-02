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