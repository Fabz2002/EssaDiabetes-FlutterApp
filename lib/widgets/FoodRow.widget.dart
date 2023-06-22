import 'package:flutter/material.dart';

import '../common/models/comida.dart';
import '../view/FoodData.view.dart';
import 'comidasPlan.widget.dart';

class FoodRow extends StatelessWidget {
  final String title;
  final List<Items> itemsList;

  const FoodRow({
    Key? key,
    required this.title,
    required this.itemsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleKindsFood(title: title),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(itemsList.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodInfo(items: itemsList[index]),
                  ),
                );
              },
              child: _buildContainer(context, itemsList[index]),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildContainer(BuildContext context, Items item) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20 / 2, bottom: 10 * 2),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: const Color.fromRGBO(165, 195, 223, 1),
        image: DecorationImage(
          image: NetworkImage(item.img!),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.titulo ?? "",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "${item.kcal} calorias",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
