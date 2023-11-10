import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myfirst/Product_card.dart';
import 'package:myfirst/code.dart';
import 'package:myfirst/infrstructure/models/courses.dart';
import 'package:myfirst/infrstructure/services/content.dart';
import 'package:myfirst/infrstructure/services/courses.dart';

import 'package:myfirst/models/bagModel.dart';

import 'package:myfirst/product_details.dart';
import 'package:myfirst/utils/codedetails.dart';
import 'package:myfirst/utils/constants.dart';
import 'package:provider/provider.dart';

import 'infrstructure/helper/admob_helper.dart';
import 'infrstructure/models/content.dart';

class ListContent extends StatefulWidget {
  const ListContent({
    super.key,
    required this.size,
    required this.courseID,
    required this.bagModel,
  });
  final Size size;
  final CourseModel bagModel;
  final String courseID;
  @override
  State<ListContent> createState() => _ListContentState();
}

class _ListContentState extends State<ListContent> {
  AdmobHelper admobHelper = new AdmobHelper();
  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    admobHelper.createInterad();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
      body: Column(children: [
        Container(
          child: AdWidget(
            ad: AdmobHelper.getBannerAd()..load(),
            key: UniqueKey(),
          ),
          height: 50,
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                //  height: size.height / 10,
                margin: const EdgeInsets.only(top: 40),
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
              ),
              FutureProvider.value(
                value: ContentServices()
                    .getAllContent(context, widget.courseID.toString()),
                initialData: [ContentModel()],
                catchError: (context, e) {
                  log(e.toString());
                },
                builder: (context, child) {
                  List<ContentModel> _list =
                      context.watch<List<ContentModel>>();

                  return _list[0].name == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: _list.length,
                          itemBuilder: (context, i) => Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: GestureDetector(
                              onTap: () {
                                admobHelper.createInterad();
                                admobHelper.showInterad();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ContentDescriptionView(
                                              size: size,
                                              bagModel: _list[i],
                                            )));
                              },
                              child: ProductCard(
                                size: size,
                                name: _list[i].name.toString(),
                              ),
                            ),
                          ),
                        );
                },
              )
            ],
          ),
        )
      ]),
      bottomNavigationBar: Container(
        child: AdWidget(
          ad: AdmobHelper.getBannerAd()..load(),
          key: UniqueKey(),
        ),
        height: 50,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text("Content"),
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.black,
    );
  }
}

class ContentDescriptionView extends StatelessWidget {
  const ContentDescriptionView({
    super.key,
    required this.size,
    required this.bagModel,
  });

  final Size size;
  final ContentModel bagModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: SafeArea(
          child: Markdown(
            data: bagModel.description.toString(),
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
