import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:practice/model/login_model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String urlRequest = "http://10.0.2.2:8000/login";

    final response =
        await http.post(Uri.parse(urlRequest), body: requestModel.toJson());
      print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
