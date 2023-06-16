import 'package:cloud_firestore/cloud_firestore.dart';

class Comida {
  Comida({required this.desayuno, required this.almuerzo, required this.cena});
  final List<Items> desayuno;
  final List<Items> almuerzo;
  final List<Items> cena;
  factory Comida.fromSnapShot(DocumentSnapshot snapshot) {
    final List<dynamic> temp = [];
    final dat = snapshot.data() as Map<String, dynamic>;
    return Comida(
      almuerzo: getList(
          dat.containsKey("almuerzo") ? snapshot.get("almuerzo") : temp),
      cena: getList(dat.containsKey("cena") ? snapshot.get("cena") : temp),
      desayuno: getList(
          dat.containsKey("desayuno") ? snapshot.get("desayuno") : temp),
    );
  }
}

List<Items> getList(List<dynamic> items) {
  List<Items> itemsTemp = [];
  for (final item in items) {
    itemsTemp.add(Items.fromData(item));
  }
  return itemsTemp;
}

class Items {
  Items(
      {required this.carbs,
      required this.desc,
      required this.grasas,
      required this.img,
      required this.kcal,
      required this.prote,
      required this.titulo});
  final int? carbs;
  final String? desc;
  final int? grasas;
  final String? img;
  final int? kcal;
  final int? prote;
  final String? titulo;
  factory Items.fromData(Map<String, dynamic> data) {
    return Items(
      carbs: data["carbs"],
      desc: data["desc"],
      grasas: data["grasas"],
      kcal: data["kcal"],
      prote: data["prote"],
      titulo: data["titulo"],
      img: data["img"],
    );
  }
}
