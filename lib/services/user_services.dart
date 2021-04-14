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

  static Future<ApiReturnValue<User>> signInEmail(
      String nama,
      int gender,
      String email,
      int provinsi,
      int kota,
      String tempatLahir,
      String tglLahir,
      String identifier,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL2 + 'mobile/register';
    var response = await client.post(url, headers: {
      "Content-Type": "application/json"
    }, body: aConvert.jsonEncode({
      'nama': nama,
      'gender': gender,
      'email': email,
      'provinsi': provinsi,
      'kota':kota,
      'tempat_lahir': tempatLahir,
      'tgl_lahir': tglLahir,
      'identifier': identifier,
    }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }else{
      return ApiReturnValue(message: 'Succes');
    }

    // var data = aConvert.jsonDecode(response.body);
    // User value = User.fromJson(data['response']);

    // return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> getDeviceDetails() async {
    String deviceName;
    String deviceVersion;
    String identifier;
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceName = build.model;
        deviceVersion = build.version.toString();
        identifier = build.androidId; //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceName = data.name;
        deviceVersion = data.systemVersion;
        identifier = data.identifierForVendor; //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

//if (!mounted) return;
    return ApiReturnValue(message: identifier);
  }
}
