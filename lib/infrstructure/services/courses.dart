import 'package:flutter/material.dart';
import 'package:myfirst/infrstructure/models/courses.dart';

import '../helper/api_helper.dart';

final ApiBaseHelper _helper = ApiBaseHelper();

class CourseServices {
  ///Get Courses
  Future<List<CourseModel>> getCourses(BuildContext context) async {
    final response =
        await _helper.get(context, endPoint: '/api/admin/courseapi');
    List<CourseModel> _list = [];
    for (var i in response['data']) {
      _list.add(CourseModel.fromJson(i));
    }
    return _list;
  }
}
