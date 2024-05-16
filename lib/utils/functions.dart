import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Functions{
  static Future<http.Response> postRequest(Uri uri,
     ) async {
      var response = await http.post(
        uri,
      );
      log(response.body);
      return response;
  }

}