part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class GetCartLoading extends CartState {}
final class GetCartSuccess extends CartState {
  final CartEntity cartEntity;

  GetCartSuccess(this.cartEntity);
}
final class GetCartError extends CartState {
  final String error;

  GetCartError(this.error);
}
final class GetCartEmpty extends CartState {}
