import 'package:sadeem_task/features/products_feature/data/model/response/product_dto.dart';
import 'package:sadeem_task/features/products_feature/domain/entites/response/product_entity.dart';

class ProductMapper {
  static ProductsEntity productDtoToEntity(ProductDto productDto) {
    return ProductsEntity(
      products:
          productDto.products?.map((product) {
            return ProductEntity(
              id: product.id,
              title: product.title,
              price: product.price,
              description: product.description,
              images: product.images,
              rating: product.rating,
              reviews:
                  product.reviews?.map((review) {
                    return ReviewEntity(
                      rating: review.rating,
                      comment: review.comment,
                      date: review.date,
                      reviewerName: review.reviewerName,
                      reviewerEmail: review.reviewerEmail,
                    );
                  }).toList(),
              discountPercentage: product.discountPercentage,
              thumbnail: product.thumbnail,
              weight: product.weight,
              stock: product.stock,
            );
          }).toList(),
    );
  }
}
