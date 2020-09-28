import 'dart:convert';
import 'dart:io';
import 'package:bookapp/app/models/library_model.dart';
import 'package:bookapp/app/models/user_model.dart';
import 'package:bookapp/app/services/shared_local_storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:bookapp/app/models/api_response_model.dart';
import 'package:bookapp/app/utils/default.dart';
import 'package:bookapp/app/utils/constants.dart';

Future<APIResponseModel> login(data) async {
  String apiUrl = "$API_URL/user/login";
  SharedLocalStorageServices sharedPrefs = new SharedLocalStorageServices();

  try {
    print("Make Login");

    final body = json.encode(data);

    final response = await http.post("$apiUrl",
        body: body, headers: {"Content-Type": "application/json"});

    print("RESPONSE CODE ");
    print(response.statusCode);

    print("Response logging");
    print(response.body);

    userState.setCount(2020);

    var apiResponse = APIResponseModel.fromJson(json.decode(response.body));
    apiResponse.headers = response.headers;

    if (apiResponse.code == "202") {
      var data = apiResponse.data;
      UserModel user = UserModel.formJson(data['user']);
      user.token = data['token'];
      //Set userModel State

      userState.changeUserModel(user);

      //Save user data in SharedPreferences
      sharedPrefs.put("token", user.token);
      sharedPrefs.put("userType", (user.userType == UserType.Reader) ? 1 : 2);
      sharedPrefs.put("userID", user.idUsuario);

      if (user.userType == UserType.Library) {
        LibraryModel library = LibraryModel.formJson(data['user']);
        userState.changeLibraryModel(library);
      } else {
        //IS READER
      }
    }

    return apiResponse;
  } catch (e) {
    print("Error logging");
    print(e);

    return APIResponseModel.onException();
  }
}

Future<APIResponseModel> verifyEmail(email) async {
  String apiUrl = "$API_URL/user/verifyEmail";

  try {
    print("Checking e-mail");

    final body = json.encode({"email": email});

    final response = await http.post("$apiUrl",
        body: body, headers: {"Content-Type": "application/json"});

    print("Response checking e-mail");
    print(response.body);

    var apiResponse = APIResponseModel.fromJson(json.decode(response.body));
    apiResponse.headers = response.headers;

    return apiResponse;
  } catch (e) {
    print("Error checking e-mail");
    print(e);
    return APIResponseModel.onException();
  }
}

Future<APIResponseModel> verifyPhone(phone) async {
  String apiUrl = "$API_URL/user/verifyPhone";

  try {
    print("Checking phone");

    final body = json.encode({"phone": phone});

    final response = await http.post("$apiUrl",
        body: body, headers: {"Content-Type": "application/json"});

    print("Response checking phone");
    print(response.body);

    var apiResponse = APIResponseModel.fromJson(json.decode(response.body));
    apiResponse.headers = response.headers;

    return apiResponse;
  } catch (e) {
    print("Error checking phone");
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
