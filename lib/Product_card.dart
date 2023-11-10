import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.size, required this.name});

  final Size size;

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width / 27),
      child: Stack(
        children: [
          Container(
            height: size.height / 15.8,
            margin: EdgeInsets.symmetric(horizontal: size.width / 24),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 39, 40, 39),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 15),
                    blurRadius: 0,
                  )
                ]),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(22)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10, left: 50, bottom: 10),
              child: Text(
                '$name',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Century Gothic',
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
