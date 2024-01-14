import 'dart:convert';
import 'dart:io';

import 'package:flutter_fitness_app/data/app_exceptions.dart';
import 'package:flutter_fitness_app/data/network/BaseApiServices.dart';
import 'package:http/http.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnautorizedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server with status code ${response.statusCode.toString()}');
    }
  }
}
