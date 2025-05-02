part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetProductLoading extends ProductState {}
final class GetProductSuccess extends ProductState {
  final ProductsEntity productsEntity;

  GetProductSuccess(this.productsEntity);
}
final class GetProductError extends ProductState {
  final String error;

  GetProductError(this.error);
}
