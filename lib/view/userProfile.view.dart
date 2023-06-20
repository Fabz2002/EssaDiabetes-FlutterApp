// ignore_for_file: avoid_print

import 'package:first_app_flutter/widgets/drawerContainer.widget.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/world.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 50,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          iconSize: 35.0,
                          color: kWhiteColor,
                          icon: const Icon(Icons.menu),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 230,
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 20,
                        top: 30,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 230,
                      decoration: const BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mis Alimentos",
                                style: TextStyle(
                                  color: kDarkGreyColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: foodItems.map((foodItem) {
                                      return FoodItem(
                                        title: foodItem['title']!,
                                        calories: foodItem['calories']!,
                                        comments: foodItem['comments']!,
                                        imagePath: foodItem['imagePath']!,
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                // Acciones al presionar el botón sticky
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      drawer: DrawerForInfo(scaffoldKey: _scaffoldKey),
    );
  }
}
