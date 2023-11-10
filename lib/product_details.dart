import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myfirst/models/bagModel.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.bagmodel});

  final Bagmodel bagmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Row(
          children: [
            Text(
              bagmodel.name,
            ),
            Text(
              bagmodel.code,
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text("Back"),
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.black,
    );
  }
}
