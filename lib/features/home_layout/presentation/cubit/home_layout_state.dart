part of 'home_layout_cubit.dart';

@immutable
sealed class HomeLayoutState {
  Widget getWidget();
}

final class ProductsScreenState extends HomeLayoutState {
  @override
  Widget getWidget() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => getIt<ProductCubit>()..doAction(GetProductsAction()),
        ),
        BlocProvider(create: (context) => getIt<CartCubit>()),
      ],
      child: const ProductsScreen(),
    );
  }
}

final class CartScreenState extends HomeLayoutState {
  @override
  Widget getWidget() {
    return BlocProvider(
      create: (context) => getIt<CartCubit>()..getCartItems(),
      child: CartScreen(),
    );
  }
}
