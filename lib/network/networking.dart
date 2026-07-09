import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class NetworkHelper<T> {
  final Map<String, String>? _header;
  final Uri _uri;
  final T Function(Map<String, dynamic>)? _fromJson;

  NetworkHelper({required this._uri, this._fromJson, this._header});

  Future<T> get() async {
    Response response = await http.get(_uri, headers: _header);
    if (response.statusCode == 200) {
      if (_fromJson != null) {
        return _fromJson(jsonDecode(response.body));
      } else {
        return response.body as T;
      }
    }
    throw NetworkingException(response.reasonPhrase);
  }
}

class NetworkingException implements Exception {
  final String? message;
  NetworkingException([this.message = 'Something went wrong']);
}
