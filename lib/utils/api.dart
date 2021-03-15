import 'dart:convert';
import 'dart:io';
import 'package:origora/utils/app_log_printer.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  // next three lines makes this class a Singleton
  static ServiceApi _instance = new ServiceApi.internal();
  ServiceApi.internal();
  factory ServiceApi() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();
  final logger = getLogger("utils.api.dart");

  Future<dynamic> get(String url, {String token}) {
    logger.w('>>>>>>>>>>>>> GET: $url');
    return http.get(url, headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    }).then(_returnResponse);
  }

  Future<dynamic> post(String url, {Map data, String token}) {
    logger.w('>>>>>>>>>>>>> POST" $url');
    logger.w('>>>>>>>>>>>>> Data: ' + json.encode(data));

    return http.post(url, body: json.encode(data), headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    }).then(_returnResponse);
  }

  Future<dynamic> patch(String url, {Map data, String token}) {
    logger.w('>>>>>>>>>>>>> PATCH: $url');
    logger.w('>>>>>>>>>>>>> Data: ' + json.encode(data));

    return http.patch(url, body: json.encode(data), headers: {
      'Content-Type': 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    }).then(_returnResponse);
  }

  // internal functions
  dynamic _returnResponse(http.Response response) {
    final String res = response.body;
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 400 || json == null) {
      logger.e('==== FAILED ====');
      logger.e('>>>>>>>>>>>>> body $res');
      // return _decoder.convert(res);
      throw new Exception(_decoder.convert(res));
      // return ErrorResponseModel.fromJson(_decoder.convert(res));
    }

    logger.i('==== SUCCESS ====');
    logger.i('>>>>>>>>>>>>> response: $res');
    return _decoder.convert(res);
  }
}
