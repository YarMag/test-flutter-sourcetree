
abstract class INetworkService {
  Future<T> requestGET<T>(String url, Map<String, dynamic> queryParameters);
  Future<T> requestPOST<T>(String url, Map<String, dynamic> queryParameters);
  Future<T> requestPATCH<T>(String url, Map<String, dynamic> queryParameters);
  Future<T> requestDELETE<T>(String url, Map<String, dynamic> queryParameters);
}
