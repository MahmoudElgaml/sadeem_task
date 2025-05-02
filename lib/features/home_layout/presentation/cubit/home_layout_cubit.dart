import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:sadeem_task/features/products_feature/presentation/pages/products_screen.dart';

part 'home_layout_state.dart';
@injectable
class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(ProductsScreenState());

  void changeScreen(int index) {
    switch (index) {
      case 0:
        emit(ProductsScreenState());
        break;
      case 1:
        emit(CartScreenState());
        break;
      default:
        emit(ProductsScreenState());
    }
  }
}
