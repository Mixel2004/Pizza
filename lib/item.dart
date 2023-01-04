import 'package:flutter/material.dart';

import 'pizzaDetail.dart';

class ItemWidget extends StatefulWidget {
  final int item;
  ItemWidget({required this.item});

  @override
  _ItemWidgetState createState() => _ItemWidgetState(item: item);
}

class _ItemWidgetState extends State<ItemWidget>
    with SingleTickerProviderStateMixin {
  final int item;
  bool isExpanded = false;
  _ItemWidgetState({required this.item});
  String pizzaSize = 'r';
  bool isSelectedr = true;
  bool isSelectedm = false;
  bool isSelectedl = false;

  @override
  Widget build(BuildContext context) {
    if (pizzas[item] == null) {
      return const SizedBox();
    }
    final pizza = pizzas[item];
    final imageName = pizza!['image'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            bottom: isExpanded ? 225 : 175,
            child: GestureDetector(
              onPanUpdate: onPanUpdate,
              child: Container(
                width: 350,
                // color: Color.fromRGBO(255, 255, 255, 0.8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: isExpanded ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        pizza['name'] ?? '',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/images/$imageName'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AnimatedOpacity(
                      opacity: isExpanded ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: Column(
                        children: [
                          Text(
                            "Price: ${pizza[pizzaSize] ?? '10'}",
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => onClick("r"),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color:
                                        isSelectedr ? Colors.red : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "R",
                                      style: TextStyle(
                                        color: isSelectedr
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () => onClick("m"),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color:
                                        isSelectedm ? Colors.red : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "M",
                                      style: TextStyle(
                                        color: isSelectedm
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () => onClick("l"),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color:
                                        isSelectedl ? Colors.red : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "L",
                                      style: TextStyle(
                                        color: isSelectedl
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }

  void onClick(String size) {
    setState(() {
      pizzaSize = size;
      if (size == "r") {
        isSelectedr = true;
        isSelectedm = false;
        isSelectedl = false;
      } else if (size == "m") {
        isSelectedr = false;
        isSelectedm = true;
        isSelectedl = false;
      } else if (size == "l") {
        isSelectedr = false;
        isSelectedm = false;
        isSelectedl = true;
      }
    });
  }
}
