part of 'comida_bloc.dart';

@freezed
class ComidaEvent with _$ComidaEvent {
  const factory ComidaEvent.getComida(String id) = _GetComida;
  const factory ComidaEvent.pusgmessage(
    String message,
  ) = _MessageComidaEvent;
  const factory ComidaEvent.pushComida({required Comida data}) = _PushGetComida;
}
