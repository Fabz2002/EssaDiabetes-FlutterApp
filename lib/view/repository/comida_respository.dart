import 'package:dartz/dartz.dart';
import 'package:first_app_flutter/common/models/users.dart';

import 'package:first_app_flutter/core/error/failure.dart';
import 'package:injectable/injectable.dart';

import '../../common/models/comida.dart';
import '../../core/data/models/comida_firestore.dart';
import '../../core/data/models/users_firestore.dart';
import '../interfaces/i_commida.dart';

@LazySingleton(as: IComimdas)
class ComidaImplementRepository implements IComimdas {
  final CommidaFirestore _commidaFirestore;
  final UsersFirestore _usersFirestore;
  ComidaImplementRepository(this._commidaFirestore, this._usersFirestore);

  @override
  Future<Either<Failure, Comida>> getComidas(String id) async {
    try {
      String mealDoc = "";
      final resUser = await _usersFirestore.getDocument(id).get();
      final user = UserModel.fromSnapShot(resUser);
      if (user.caloriasNecesarias! >= 2000) {
        mealDoc = 'cal2300';
      }
      if (user.caloriasNecesarias! <= 1999 && user.caloriasNecesarias! > 1690) {
        mealDoc = 'cal2000';
      }
      if (user.caloriasNecesarias! <= 1690 && user.caloriasNecesarias! > 1399) {
        mealDoc = 'cal1700';
      }
      if (user.caloriasNecesarias! <= 1399) {
        mealDoc = 'cal1400';
      }
      final resComidas = await _commidaFirestore.getDocument(mealDoc).get();
      final comida = Comida.fromSnapShot(resComidas);

      return Right(comida);
    } catch (e) {
      return const Left(
        ServerFailure("Hubo un error de conexión, inténtelo mas tarde"),
      );
    }
  }
}
