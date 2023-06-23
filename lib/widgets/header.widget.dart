import 'package:first_app_flutter/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/idprovider.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.imgUser,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final String imgUser;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1.0, right: 8.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              iconSize: 35.0,
              color: Colors.grey[800],
              icon: const Icon(Icons.menu)),
          const Image(
            image: AssetImage("assets/images/essalud.png"),
            width: 50,
          ),
          GestureDetector(
            onTap: () {
              final idProvider =
                  Provider.of<IdProvider>(context, listen: false);
              Navigator.pushNamed(context, Routes.UserProfilePage,
                  arguments: idProvider.id);
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(imgUser),
            ),
          )
        ],
      ),
    );
  }
}
