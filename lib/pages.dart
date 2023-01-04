import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza/pizzaDetail.dart';

import 'item.dart';

class MenuWidget extends StatefulWidget {
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  final pageController = PageController(viewportFraction: 0.9);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: pizzas.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      'Start Exploring Your Favorite Pizza',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      FontAwesomeIcons.arrowRightLong,
                      size: 100,
                    ),
                  ],
                );
              }
              final pa = ItemWidget(item: index);
              return pa;
            },
            onPageChanged: (int index) {
              setState(() {
                pageIndex = index;
              });
            },
          ),
        )
      ],
    );
  }
}
