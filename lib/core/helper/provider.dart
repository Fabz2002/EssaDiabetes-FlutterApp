import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view/comida/comida_bloc.dart';
import '../ioc/injectable.dart';

class BlocProviderHelper {
  final providres = [
    BlocProvider<ComidaBloc>(
      create: (_) => getIt<ComidaBloc>(),
    ),
  ];
}
