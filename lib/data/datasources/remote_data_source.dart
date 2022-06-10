import 'dart:convert';

import 'package:storelist/data/models/store_model.dart';
import 'package:http/http.dart' as http show Client;
import 'package:storelist/data/models/store_response.dart';
import 'package:storelist/utils/exception.dart';

abstract class RemoteDataSource {
  Future<List<StoreModel>> getStoreRemotely(String username, String password);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  static const mockUrl = 'https://pitjarus.free.beeceptor.com/';
  static const url =
      'http://dev.pitjarus.co/api/sariroti_md/index.php/login/loginTest';

  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<StoreModel>> getStoreRemotely(
      String username, String password) async {
    Map<String, String> body = {
      'username': username,
      'password': password,
    };

    final response = await client.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      if (json.decode(response.body)['status'] != 'failure') {
        return StoreResponse.fromJson(json.decode(response.body)).storeList;
      } else {
        throw ServerException(json.decode(response.body)['message']);
      }
    } else {
      throw const ServerException('Periksa Jaringanmu!');
    }
  }
}
