part of '../pages.dart';

class CreativeBeltPoly extends StatefulWidget {
  @override
  _CreativeBeltPolyState createState() => _CreativeBeltPolyState();
}

class _CreativeBeltPolyState extends State<CreativeBeltPoly> {
  // final Set<Marker> _markers = {};
  // final Set<Polyline> _polyline = {};

  // GoogleMapController controller;

  // List<LatLng> latlngSegment1 = List();
  // List<LatLng> latlngSegment2 = List();
  // static LatLng _lat1 = LatLng(13.035606, 77.562381);
  // static LatLng _lat2 = LatLng(13.070632, 77.693071);
  // static LatLng _lat3 = LatLng(12.970387, 77.693621);
  // static LatLng _lat4 = LatLng(12.858433, 77.575691);
  // static LatLng _lat5 = LatLng(12.948029, 77.472936);
  // static LatLng _lat6 = LatLng(13.069280, 77.455844);
  // LatLng _lastMapPosition = _lat1;

  // @override
  // void initState() {
  //   super.initState();
  //   //line segment 1
  //   latlngSegment1.add(_lat1);
  //   latlngSegment1.add(_lat2);
  //   latlngSegment1.add(_lat3);
  //   latlngSegment1.add(_lat4);

  //   //line segment 2
  //   latlngSegment2.add(_lat4);
  //   latlngSegment2.add(_lat5);
  //   latlngSegment2.add(_lat6);
  //   latlngSegment2.add(_lat1);
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: GoogleMap(
  //       //that needs a list<Polyline>
  //       polylines: _polyline,
  //       markers: _markers,
  //       onMapCreated: _onMapCreated,
  //       initialCameraPosition: CameraPosition(
  //         target: _lastMapPosition,
  //         zoom: 11.0,
  //       ),
  //       mapType: MapType.normal,
  //     ),
  //   );
  // }

  // void _onMapCreated(GoogleMapController controllerParam) {
  //   setState(() {
  //     controller = controllerParam;
  //     _markers.add(Marker(
  //       // This marker id can be anything that uniquely identifies each marker.
  //       markerId: MarkerId(_lastMapPosition.toString()),
  //       //_lastMapPosition is any coordinate which should be your default
  //       //position when map opens up
  //       position: _lastMapPosition,
  //       infoWindow: InfoWindow(
  //         title: 'Awesome Polyline tutorial',
  //         snippet: 'This is a snippet',
  //       ),
  //     ));

  //     _polyline.add(Polyline(
  //       polylineId: PolylineId('line1'),
  //       visible: true,
  //       //latlng is List<LatLng>
  //       points: latlngSegment1,
  //       width: 2,
  //       color: Colors.blue,
  //     ));

  //     //different sections of polyline can have different colors
  //     _polyline.add(Polyline(
  //       polylineId: PolylineId('line2'),
  //       visible: true,
  //       //latlng is List<LatLng>
  //       points: latlngSegment2,
  //       width: 2,
  //       color: Colors.red,
  //     ));
  //   });
  // }
  GoogleMapController mapController;
  double _originLatitude = -6.905977, _originLongitude = 107.613144;
  double _destLatitude = -6.9218571, _destLongitude = 107.6048254;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = 'AIzaSyCsdKGh8uD1xmFtTaPvl5ZXSMhtTVHfn7s';

  @override
  void initState() {
    super.initState();

    /// origin marker
    _addMarker(LatLng(_originLatitude, _originLongitude), "origin",
        BitmapDescriptor.defaultMarker);

    /// destination marker
    _addMarker(LatLng(_destLatitude, _destLongitude), "destination",
        BitmapDescriptor.defaultMarkerWithHue(90));
    _getPolyline();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(-6.905977, 107.613144), zoom: 15),
        myLocationEnabled: true,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        onMapCreated: _onMapCreated,
        markers: Set<Marker>.of(markers.values),
        polylines: Set<Polyline>.of(polylines.values),
      )),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints?.getRouteBetweenCoordinates(
        googleAPiKey,
        PointLatLng(_originLatitude, _originLongitude),
        PointLatLng(_destLatitude, _destLongitude),
        travelMode: TravelMode.bicycling,
        wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);
    print(result.points);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        print('===========>');
        print(point.latitude);
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print('=============> Empty');
    }
    _addPolyLine();
  }
}
