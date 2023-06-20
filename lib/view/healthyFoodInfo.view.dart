import 'package:first_app_flutter/theme.dart';
import 'package:first_app_flutter/widgets/drawerContainer.widget.dart';
import 'package:flutter/material.dart';

import '../Static/foodhealthyinfo.dart';

class HealthyFoodInfoView extends StatefulWidget {
  final FoodHealthyInfo healthyfoodinfo;

  const HealthyFoodInfoView({Key? key, required this.healthyfoodinfo})
      : super(key: key);

  @override
  State<HealthyFoodInfoView> createState() => _HealthyFoodInfoViewState();
}

class _HealthyFoodInfoViewState extends State<HealthyFoodInfoView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(_pageListener);
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    setState(() {
      _currentPage = _pageController.page!.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.healthyfoodinfo.img),
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
                    color: Colors.white,
                    icon: const Icon(Icons.menu),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 20,
                  top: 30,
                ),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.healthyfoodinfo.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: kPrimaryColor,
                          ),
                          Text(widget.healthyfoodinfo.origin),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < widget.healthyfoodinfo.stars
                                    ? Colors.amber[400]
                                    : Colors.grey[600],
                              );
                            }),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 35,
                        child: Text(
                          "Descripción",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.healthyfoodinfo.description,
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.8),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Beneficios",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        height: 70,
                        child: Stack(
                          children: [
                            PageView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: _pageController,
                              itemCount: widget.healthyfoodinfo.benefits.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    widget.healthyfoodinfo.benefits[index],
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 16,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  widget.healthyfoodinfo.benefits.length,
                                  (index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 4.0,
                                    ),
                                    width: 8.0,
                                    height: 8.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _currentPage == index
                                          ? kPrimaryColor
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerForInfo(scaffoldKey: _scaffoldKey),
    );
  }
}
