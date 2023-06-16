import 'package:dartz/dartz.dart';
import '../../common/models/comida.dart';
import '../../core/error/failure.dart';

abstract class IComimdas {
  Future<Either<Failure, Comida>> getComidas(String id);
}
