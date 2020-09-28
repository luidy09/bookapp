import 'dart:convert';
import 'dart:io';

import 'package:bookapp/app/models/api_response_model.dart';
import 'package:bookapp/app/utils/default.dart';
import 'package:http/http.dart' as http;
import '../shared_local_storage_service.dart';

Future<APIResponseModel> addBook(book) async {
  SharedLocalStorageServices sharedPrefs = new SharedLocalStorageServices();

  String apiUrl = "$API_URL/book/addLivro";

  try {
    print("make add book");
    String token = await sharedPrefs.get('token');

    final body = json.encode(book);

    final response = await http.post("$apiUrl", body: body, headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json"
    });

    print("Response add book");
    print(response.body);

    print("STATUS CODE ${response.statusCode} ");

    var apiResponse = APIResponseModel.fromJson(json.decode(response.body));
    apiResponse.headers = response.headers;

    return apiResponse;
  } catch (e) {
    print("Error occured trying to add book");
    print(e);
    return APIResponseModel.onException();
  }
}

Future<APIResponseModel> getBooks() async {
  SharedLocalStorageServices sharedPrefs = new SharedLocalStorageServices();

  String apiUrl = "$API_URL/book/ListarLivros";

  try {
    print("make get books");
    String token = await sharedPrefs.get('token');

    final response = await http.get("$apiUrl", headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json"
    });

    print("Response get books");
    // print(response.body);

    print("STATUS CODE ${response.statusCode} ");

    var apiResponse = APIResponseModel.fromJson(json.decode(response.body));
    apiResponse.headers = response.headers;

    return apiResponse;
  } catch (e) {
    print("Error occured trying to get book");
    print(e);
    return APIResponseModel.onException();
  }
}
