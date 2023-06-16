part of 'comida_bloc.dart';

@freezed
class ComidaState with _$ComidaState {
  const factory ComidaState.initial() = InitialComida;
  const factory ComidaState.message(String message) = MessageGetComida;
  const factory ComidaState.loadSuccess({required Comida data}) =
      LoadSuccessGetComida;
}
