import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:myfirst/infrstructure/models/courses.dart';
import 'package:myfirst/models/bagModel.dart';

class Code extends StatelessWidget {
  const Code({
    super.key,
    required this.size,
    required this.bagModel,
  });

  final Size size;
  final CourseModel bagModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
          child: Markdown(
            data: bagModel.contentsname.toString(),
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
