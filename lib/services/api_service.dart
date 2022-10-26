import 'package:customer_data/models/login_page_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DioClient {
  final Dio _dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) async {
        final _sharedPref = await SharedPreferences.getInstance();
        if (_sharedPref.containsKey('token')) {
          options.headers["Authorization"] =
          "Bearer ${_sharedPref.getString('token')}";
        }
        return handler.next(options);
      }),
    );
  static const baseUrl = 'http://raheemagency.b2bdigitize.com';
  Future<LogInModel?> login() async {
    try {
      final response = await _dio.get('$baseUrl/api');
      print('response: $response');
      if (response.statusCode == 200) {
        return LogInModel.fromJson(response.data);
      } else {
        throw 'Internet Connection error';
      }
    } catch (e) {
      rethrow;
    }
  }

}
