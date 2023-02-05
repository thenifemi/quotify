// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:quotify/application/quotes/quotes_bloc.dart' as _i5;
import 'package:quotify/domain/quotes/quotes_interface.dart' as _i3;
import 'package:quotify/infrastructure/quotes/quotes_repository.dart' as _i4;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.QuotesInterface>(() => _i4.QuotesRepository());
    gh.factory<_i5.QuotesBloc>(() => _i5.QuotesBloc(gh<_i3.QuotesInterface>()));
    return this;
  }
}
