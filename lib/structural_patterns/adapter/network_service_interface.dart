import 'package:flutter/foundation.dart';

abstract class INetworkService {
  Future<T> performGET<T>(
      {@required String url, Map<String, dynamic> parameters});

  Future<T> performPOST<T>(
      {@required String url, Map<String, dynamic> parameters});

  Future<T> performPATCH<T>(
      {@required String url, Map<String, dynamic> parameters});
}

class DioNetworkService implements INetworkService {
  // TODO: implement using dio library
  Future<T> performGET<T>(
      {@required String url, Map<String, dynamic> parameters}) {
    return null;
  }

  Future<T> performPOST<T>(
      {@required String url, Map<String, dynamic> parameters}) {
    return null;
  }

  Future<T> performPATCH<T>(
      {@required String url, Map<String, dynamic> parameters}) {
    return null;
  }
}