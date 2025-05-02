part of 'home_layout_cubit.dart';

@immutable
sealed class HomeLayoutState {
  Widget getWidget();
}

final class ProductsScreenState extends HomeLayoutState {
  @override
  Widget getWidget() {
    return const ProductsScreen();
  }
}

final class CartScreenState extends HomeLayoutState {
  @override
  Widget getWidget() {
    return const Placeholder();
  }
}
