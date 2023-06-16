import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../common/models/comida.dart';
import '../../common/models/users.dart';
import '../../core/error/failure.dart';
import '../interfaces/i_commida.dart';

part 'comida_state.dart';
part 'comida_event.dart';
part 'comida_bloc.freezed.dart';

@injectable
class ComidaBloc extends Bloc<ComidaEvent, ComidaState> {
  final IComimdas icomimdas;
  ComidaBloc(this.icomimdas) : super(const ComidaState.initial());

  @override
  Stream<ComidaState> mapEventToState(ComidaEvent event) async* {
    yield* event.map(
      getComida: (e) async* {
        yield const ComidaState.initial();
        final response = await icomimdas.getComidas(e.id);
        response.fold(
          (l) {
            if (l is ServerFailure) {
              add(ComidaEvent.pusgmessage(l.message));
            }
          },
          (data) => add(
            ComidaEvent.pushComida(data: data),
          ),
        );
      },
      pusgmessage: (_MessageComidaEvent value) async* {
        yield ComidaState.message(value.message);
      },
      pushComida: (_PushGetComida value) async* {
        yield ComidaState.loadSuccess(data: value.data);
      },
    );
  }
}
