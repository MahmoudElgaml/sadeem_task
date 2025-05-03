import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:sadeem_task/core/cache/hive/hive_keyes.dart';

import 'package:sadeem_task/features/auth/data/model/response/log_in_response_dto.dart';
import 'package:sadeem_task/features/auth/domain/entites/response/login_response_entity.dart';
@injectable
class HiveManager {
  Future<void> inti() async {
    await Hive.initFlutter();
    _registerAdapter();
    await _openBox();
  }

  void _registerAdapter() {
    Hive.registerAdapter(LoginResponseEntityAdapter());
  }

  Future<void> _openBox() async {
    await Hive.openBox<LoginResponseEntity>(HiveKeys.userBox);
  }

  void cacheData<T>({
    required String boxKey,
    List<T>? dataList,
    T? dataItem,
  }) async {
    var box = Hive.box<T>(boxKey);

    if (dataList != null) {
      box.addAll(dataList);
    } else if (dataItem != null) {
      box.add(dataItem);
    }
  }

  List<T> retrieveData<T>(String boxKey) {
    var box = Hive.box<T>(boxKey);

    return box.values.toList();
  }

  void cacheUserData({
    required String boxKey,
    required LoginResponseEntity userModel,
  }) async {
    var box = Hive.box<LoginResponseEntity>(boxKey);
    box.put(HiveKeys.userBox, userModel);
  }

  LoginResponseEntity? retrieveUserData(String boxKey) {
    var box = Hive.box<LoginResponseEntity>(boxKey);
    return box.get(HiveKeys.userBox);
  }

  deleteData<T>(String boxKey) {
    var box = Hive.box<T>(boxKey);
  }
}
