import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:myfirst/infrstructure/models/content.dart';
import 'package:http/http.dart' as http;
import '../helper/api_helper.dart';
import '../models/courses.dart';

final ApiBaseHelper _helper = ApiBaseHelper();
class ContentServices {
  Future<List<ContentModel>> getAllContent(BuildContext context, String courseID) async {
    try{

      final response =
      await _helper.get(context, endPoint: '/api/admin/contentapi/search/$courseID');
      List<ContentModel> _list = [];
      log(response.toString());
      // log(response['data'].toString());
      for (var i in response) {
        _list.add(ContentModel.fromJson(i));
      }
      return _list;
    }catch(e){
      rethrow;
    }
  }

}
