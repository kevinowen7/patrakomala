part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signInSSO(
      String email, String password, String identifier,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + 'mobile/login';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert.jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'identifier': identifier
        }));

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
      String notel,
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
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert.jsonEncode({
          'nama': nama,
          'gender': gender,
          'email': email,
          'phone': notel,
          'provinsi': provinsi,
          'kota': kota,
          'tempat_lahir': tempatLahir,
          'tgl_lahir': tglLahir,
          'identifier': identifier,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = aConvert.jsonDecode(response.body);
    User value = User.fromJson(data['response']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> getIdentifier(
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var phoneIdentifier = sharedPreferences.getString('identifier');
    String url = baseURL2 + 'mobile/identifier';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert.jsonEncode(<String, String>{
          'identifier': phoneIdentifier,
        }));

    var data = aConvert.jsonDecode(response.body);
    var cloudIdentifier = (data['response']) ? phoneIdentifier : 'no-data';

    return ApiReturnValue(value: cloudIdentifier);

    // return;
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
