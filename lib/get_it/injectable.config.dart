// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/network/dio_client.dart' as _i393;
import '../data/datasource/local_datasource/quote_local_data_source.dart'
    as _i126;
import '../data/datasource/remote_datasource/quote_remote_datasource.dart'
    as _i216;
import '../data/repository/quote_repository.dart' as _i986;
import '../domain/repository/quote_repository_impl.dart' as _i62;
import '../presentation/cubit/favourite_cubit/favourite_cubit.dart' as _i754;
import '../presentation/cubit/quote_cubit/quote_cubit.dart' as _i896;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final dioModule = _$DioModule();
  gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
  gh.lazySingleton<_i126.QuoteLocalDataSource>(
    () => _i126.QuoteLocalDataSourceImpl(),
  );
  gh.lazySingleton<_i216.QuoteRemoteDataSource>(
    () => _i216.QuoteRemoteDataSourceImpl(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i986.QuoteRepository>(
    () => _i62.QuoteRepositoryImpl(
      gh<_i216.QuoteRemoteDataSource>(),
      gh<_i126.QuoteLocalDataSource>(),
    ),
  );
  gh.factory<_i754.FavoritesCubit>(
    () => _i754.FavoritesCubit(gh<_i986.QuoteRepository>()),
  );
  gh.factory<_i896.QuoteCubit>(
    () => _i896.QuoteCubit(gh<_i986.QuoteRepository>()),
  );
  return getIt;
}

class _$DioModule extends _i393.DioModule {}
