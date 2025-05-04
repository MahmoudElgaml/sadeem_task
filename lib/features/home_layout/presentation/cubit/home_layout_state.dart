part of 'home_layout_cubit.dart';

@immutable
sealed class HomeLayoutState {
  Widget getWidget();
}

final class ProductsScreenState extends HomeLayoutState {
  @override
  Widget getWidget() {
    return BlocProvider(
      create: (context) => getIt<ProductCubit>()..doAction(GetProductsAction()),
      child: const ProductsScreen(),
    );
  }
}

final class CartScreenState extends HomeLayoutState {
  @override
  Widget getWidget() {
    return const CartScreen();
  }
}
