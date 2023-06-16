import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
  @override
  List<Object> get props => [];
}

class FirebaseFailure extends Failure {
  final String message;
  const FirebaseFailure(this.message);
  @override
  String toString() => 'FirebaseFailure($message)';
}

class CacheFailure extends Failure {}

class ServerFailure extends Failure {
  final String message;
  const ServerFailure(this.message);
}

class NonConnectionFailure extends Failure {}

class NonShopsFounded extends Failure {}

class NonMarketsFounded extends Failure {}
