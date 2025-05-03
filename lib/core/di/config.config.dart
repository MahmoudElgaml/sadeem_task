// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_source/remote/login_remote.dart' as _i77;
import '../../features/auth/data/repo/login_repo_impl.dart' as _i795;
import '../../features/auth/domain/repo/login_repo.dart' as _i543;
import '../../features/auth/domain/use_case/login_use_case.dart' as _i973;
import '../../features/auth/presentation/cubit/login_cubit.dart' as _i69;
import '../../features/home_layout/presentation/cubit/home_layout_cubit.dart'
    as _i579;
import '../../features/products_feature/data/data_source/remote/product_remote.dart'
    as _i998;
import '../../features/products_feature/data/repo/product_repo_impl.dart'
    as _i953;
import '../../features/products_feature/domain/repo/product_repo.dart'
    as _i1073;
import '../../features/products_feature/domain/use_case/get_product_use_case.dart'
    as _i556;
import '../../features/products_feature/presentation/cubit/product_cubit.dart'
    as _i880;
import '../api/dio_factory.dart' as _i1008;
import '../cache/hive/hive_manager.dart' as _i329;
import '../cache/storage_token.dart' as _i170;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioFactory = _$DioFactory();
    gh.factory<_i329.HiveManager>(() => _i329.HiveManager());
    gh.factory<_i170.StorageToken>(() => _i170.StorageToken());
    gh.factory<_i579.HomeLayoutCubit>(() => _i579.HomeLayoutCubit());
    gh.singleton<_i361.Dio>(() => dioFactory.getDio());
    gh.factory<_i77.LoginRemote>(() => _i77.LoginRemote(gh<_i361.Dio>()));
    gh.factory<_i998.ProductRemote>(() => _i998.ProductRemote(gh<_i361.Dio>()));
    gh.factory<_i1073.ProductRepo>(
        () => _i953.ProductRepoImpl(gh<_i998.ProductRemote>()));
    gh.factory<_i543.LoginRepo>(
        () => _i795.LoginRepoImpl(gh<_i77.LoginRemote>()));
    gh.factory<_i556.GetProductUseCase>(
        () => _i556.GetProductUseCase(gh<_i1073.ProductRepo>()));
    gh.factory<_i973.LoginUseCase>(
        () => _i973.LoginUseCase(gh<_i543.LoginRepo>()));
    gh.factory<_i880.ProductCubit>(
        () => _i880.ProductCubit(gh<_i556.GetProductUseCase>()));
    gh.factory<_i69.LoginCubit>(
        () => _i69.LoginCubit(gh<_i973.LoginUseCase>()));
    return this;
  }
}

class _$DioFactory extends _i1008.DioFactory {}
