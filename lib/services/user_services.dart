part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signInSSO(String email, String password,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + 'mobile/login';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert.jsonEncode(
            <String, String>{'email': email, 'password': password}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = aConvert.jsonDecode(response.body);
    User value = User.fromJson(data['response']);

    return ApiReturnValue(value: value);
  }
}
