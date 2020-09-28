import 'dart:convert';
import 'dart:io';
import 'package:bookapp/app/services/shared_local_storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:bookapp/app/models/api_response_model.dart';
import 'package:bookapp/app/utils/default.dart';

Future<APIResponseModel> addLibrary(data) async {
  String apiUrl = "$API_URL/addLivraria";

  try {
    print("make add library");

    final body = json.encode(data);
    print(body);

    final response = await http.post("$apiUrl",
        body: body, headers: {"Content-Type": "application/json"});

    print("Response add Library");
    print(response.body);

    print("RESPONSE CODE ${response.statusCode}");

    var apiResponse = APIResponseModel.fromJson(json.decode(response.body));
    apiResponse.headers = response.headers;

    return apiResponse;
  } catch (e) {
    print("Error add Library");
    print(e);
    return APIResponseModel.onException();
  }
}

Future<APIResponseModel> getLibraryData(idUsuario) async {
  SharedLocalStorageServices sharedPrefs = new SharedLocalStorageServices();
  String apiUrl = "$API_URL/library/getLibraryData";

  try {
    print("make get library data");
    String token = await sharedPrefs.get('token');

    final body = json.encode({"idUsuario": idUsuario});

    final response = await http.post("$apiUrl", body: body, headers: {
      HttpHeaders.authorizationHeader: "Bearer $token",
      "Content-Type": "application/json"
    });

    print("Response get library Library");
    print(response.body);

    print("STATUS CODE ${response.statusCode} ");

    var apiResponse = APIResponseModel.fromJson(json.decode(response.body));
    apiResponse.headers = response.headers;

    return apiResponse;
  } catch (e) {
    print("Error getting Library data");
    print(e);
    return APIResponseModel.onException();
  }
}
