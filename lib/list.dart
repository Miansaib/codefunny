import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myfirst/Product_card.dart';
import 'package:myfirst/code.dart';
import 'package:myfirst/infrstructure/models/courses.dart';
import 'package:myfirst/infrstructure/services/courses.dart';
import 'package:myfirst/listcontent.dart';

import 'package:myfirst/models/bagModel.dart';

import 'package:myfirst/product_details.dart';
import 'package:myfirst/utils/codedetails.dart';
import 'package:myfirst/utils/constants.dart';
import 'package:provider/provider.dart';

import 'infrstructure/helper/admob_helper.dart';

class Listt extends StatefulWidget {
  const Listt({super.key});

  @override
  State<Listt> createState() => _ListtState();
}

class _ListtState extends State<Listt> {
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
        SizedBox(
          height: 40,
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                //  height: size.height / 10,
                margin: EdgeInsets.only(top: 40),

                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
              ),
              FutureProvider.value(
                value: CourseServices().getCourses(context),
                initialData: [CourseModel()],
                builder: (context, child) {
                  List<CourseModel> _list = context.watch<List<CourseModel>>();
                  return _list.isNotEmpty
                      ? _list[0].id == null
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: _list.length,
                              itemBuilder: (context, i) => Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ListContent(
                                                  size: size,
                                                  bagModel: _list[i],
                                                  courseID:
                                                      _list[i].id.toString(),
                                                )));
                                  },
                                  child: ProductCard(
                                    size: size,
                                    name: _list[i].name.toString(),
                                  ),
                                ),
                              ),
                            )
                      : SizedBox();
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
      title: Text("Courses"),
      backgroundColor: Colors.yellow,
      foregroundColor: Colors.black,
    );
  }
}
