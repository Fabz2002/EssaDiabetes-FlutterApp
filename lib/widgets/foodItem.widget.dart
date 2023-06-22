import 'dart:ffi';

import 'package:flutter/material.dart';

import '../theme.dart';

class FoodItem extends StatelessWidget {
  final String title;
  final String calories;
  final String comments;
  final String imagePath;

  const FoodItem({
    super.key,
    required this.title,
    required this.calories,
    required this.comments,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kWhiteColor,
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    calories,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    comments,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 8.0, top: 5.0),
              child: Text(
                'Borrar',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
