part of 'shared.dart';

class MyFunctions {
  Future<String> limitDesc(String str) async {
    String pisah = str.substring(0, 10);
    String newValue = pisah;
    return newValue;
  }

  // String<void> diffDate(DateTime start, DateTime end) {
  //   final birthday = DateTime(1967, 10, 12);
  //   final date2 = DateTime.now();
  //   final difference = date2.difference(birthday).inDays;
  //   return difference;
  // }
}

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
const LatLng DEST_LOCATION = LatLng(42.6871386, -71.2143403);
