import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bookapp/app/models/api_response_model.dart';
import 'package:bookapp/app/utils/default.dart';

Future<APIResponseModel> addLibrary(data) async {
  String apiUrl = "$API_URL/addLivraria";

  try {
    print("make add library");
    print(data);

    final body = json.encode(data);

    final response = await http.post("$apiUrl",
        body: body, headers: {"Content-Type": "application/json"});

    print("Response  add Library");
    print(response.body);

    var apiResponse = APIResponseModel.fromJson(json.decode(response.body));
    apiResponse.headers = response.headers;

    print("ApiResponse.headers}");
    print(apiResponse.headers);

    return apiResponse;
  } catch (e) {
    print("Error add Library");
    print(e);
    return APIResponseModel.onException();
  }
}
