import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../exceptions.dart';

class ApiBaseHelper {
  final String _baseUrl = "http://api.themoviedb.org/3/";

  Future<dynamic> get(BuildContext context, {required String endPoint}) async {
    // var state = Provider.of<AppState>(context, listen: false);

    var responseJson;
    try {
      final response = await http.get(
        Uri.parse("http://tamil.tutussfunny.com$endPoint"),
      );
      responseJson = _returnResponse(response);
    } on SocketException catch (e) {
      // state.stateStatus(AppCurrentState.NoNetwork, callNotify: true);

      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }
  // Future<dynamic> getContent(BuildContext context, {required String contentEndPoint}) async {
  //   // var state = Provider.of<AppState>(context, listen: false);
  //
  //   var responseJson;
  //   try {
  //     final response = await http.get(
  //       Uri.parse("http://tamil.tutussfunny.com$contentEndPoint"),
  //     );
  //     responseJson = _returnResponse(response);
  //   } on SocketException catch (e) {
  //     // state.stateStatus(AppCurrentState.NoNetwork, callNotify: true);
  //
  //     throw FetchDataException('No Internet connection');
  //   }
  //
  //   return responseJson;
  // }
  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());

        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
