import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myfirst/models/bagModel.dart';

class CodeDetails extends StatelessWidget {
  const CodeDetails({super.key, required this.size, required this.bagModel});

  final Size size;
  final Bagmodel bagModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Container(
          child: Row(
            children: [
              Text(bagModel.name),
              Text(bagModel.code),
            ],
          ),
        ));
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
