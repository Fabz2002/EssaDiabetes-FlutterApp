// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../view/comida/comida_bloc.dart' as _i10;
import '../../view/interfaces/i_commida.dart' as _i8;
import '../../view/repository/comida_respository.dart' as _i9;
import '../data/models/comida_firestore.dart' as _i7;
import '../data/models/users_firestore.dart' as _i6;
import '../helper/firestore_helper.dart' as _i4;
import 'external_module.dart' as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final externalModule = _$ExternalModule();
  gh.factory<_i3.FirebaseFirestore>(() => externalModule.firestore);
  gh.lazySingleton<_i4.FirestoreHelper>(
      () => _i4.FirestoreHelper(get<_i3.FirebaseFirestore>()));
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => externalModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i6.UsersFirestore>(
      () => _i6.UsersFirestore(get<_i4.FirestoreHelper>()));
  gh.lazySingleton<_i7.CommidaFirestore>(
      () => _i7.CommidaFirestore(get<_i4.FirestoreHelper>()));
  gh.lazySingleton<_i8.IComimdas>(() => _i9.ComidaImplementRepository(
        get<_i7.CommidaFirestore>(),
        get<_i6.UsersFirestore>(),
      ));
  gh.factory<_i10.ComidaBloc>(() => _i10.ComidaBloc(get<_i8.IComimdas>()));
  return get;
}

class _$ExternalModule extends _i11.ExternalModule {}
