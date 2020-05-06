import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:start_app/business_logic/services/network/common/network_service_interface.dart';

class DioNetworkService implements INetworkService {
  final Dio _dio;

  DioNetworkService({@required String baseURL})
      : this._dio = Dio(BaseOptions(baseUrl: baseURL));

  //#region INetworkService implementation
  @override
  Future<T> requestDELETE<T>(String url, Map<String, dynamic> queryParameters) async {
    Map<String, dynamic> headers = _getHeaders();

    Response<T> response;
    try {
      response = await _dio.delete(url, queryParameters: queryParameters, options: Options(headers: headers));
    }
    on DioError catch (error) {
      print(error.message);
    }

    return response != null ? response.data : null;
  }

  @override
  Future<T> requestGET<T>(String url, Map<String, dynamic> queryParameters) async {
    Map<String, dynamic> headers = _getHeaders();

    Response<T> response;
    try {
      response = await _dio.get(url, queryParameters: queryParameters, options: Options(headers: headers));
    }
    on DioError catch (error) {
      print(error.message);
    }

    return response != null ? response.data : null;
  }

  @override
  Future<T> requestPATCH<T>(String url, Map<String, dynamic> queryParameters) async {
    Map<String, dynamic> headers = _getHeaders();

    Response<T> response;
    try {
      response = await _dio.patch(url, queryParameters: queryParameters, options: Options(headers: headers));
    }
    on DioError catch (error) {
      print(error.message);
    }

    return response != null ? response.data : null;
  }

  @override
  Future<T> requestPOST<T>(String url, Map<String, dynamic> queryParameters) async {
    Map<String, dynamic> headers = _getHeaders();

    Response<T> response;
    try {
      response = await _dio.post(url, queryParameters: queryParameters, options: Options(headers: headers));
    }
    on DioError catch (error) {
      print(error.message);
    }

    return response != null ? response.data : null;
  }
  //#endregion

  //#region Private methods
  Map<String, dynamic> _getHeaders() {

    return <String, dynamic>{
      "Content-Type": "application/json"
    };
  }
  //#endregion
}
