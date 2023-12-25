import 'package:dio/dio.dart';

class ApiServes {
  final Dio dio;
  ApiServes(this.dio);
  final String _BASE_URL = 'http://www.omdbapi.com/';
  final String apikey = '85a0438b';
  Future<dynamic> getAll({
    required String search,
    String? year,
    required int page,
  }) async {
    Response response = await dio.get(
      _BASE_URL,
      queryParameters: {
        'apikey': apikey,
        's': search,
        'y': year,
        'page': page,
      },
    );
    return response.data;
  }

  Future<dynamic> gitSingle({
    String? id = '',
    String? title = '',
  }) async {
    Response response = await dio.get(
      _BASE_URL,
      queryParameters: {
        'apikey': apikey,
        'i': id,
        't': title,
      },
    );
    return response.data;
  }
}
