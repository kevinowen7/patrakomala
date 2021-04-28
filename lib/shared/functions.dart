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

const double CAMERA_ZOOM = 15;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 150;
const LatLng SOURCE_LOCATION = LatLng(-6.8662224, 107.518792);
const LatLng SOURCE_LOCATION2 = LatLng(-6.8662226, 107.518795);
const LatLng DEST_LOCATION = LatLng(-6.8595346, 107.5138146);
const LatLng tujuan = LatLng(-6.9003016, 107.6165212);
LatLng tujuan2;
// LocationData currentLocation2;
// LocationData destinationLocation;

var lats2;
var long2;
String lokasiNow;
double jarak = 0;
dynamic encodedPoly;
dynamic encodedPoly2;
dynamic encodedPoly3;
// const double CAMERA_ZOOM = 13;
// const double CAMERA_TILT = 0;
// const double CAMERA_BEARING = 30;
// const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
// const LatLng DEST_LOCATION = LatLng(42.6871386, -71.2143403);
