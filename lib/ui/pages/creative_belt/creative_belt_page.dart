part of '../pages.dart';

class CreativeBeltPage extends StatefulWidget {
  @override
  _CreativeBeltPageState createState() => _CreativeBeltPageState();
}

class _CreativeBeltPageState extends State<CreativeBeltPage> {
  // GOOGLE MAPS POLYLINE
  // this set will hold my markers
  Set<Marker> _markersPoly = {};
  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;

  final Completer<GoogleMapController> _mapController = Completer();

  /// Set of displayed markers and cluster markers on the map
  final Set<Marker> _markers = Set();

  /// Minimum zoom at which the markers will cluster
  final int _minClusterZoom = 0;

  /// Maximum zoom at which the markers will cluster
  final int _maxClusterZoom = 19;

  /// [Fluster] instance used to manage the clusters
  Fluster<MapMarker> _clusterManager;

  /// Current map zoom. Initial zoom will be 15, street level
  double _currentZoom = 12.5;

  /// Map loading flag
  bool _isMapLoading = true;

  /// Markers loading flag
  bool _areMarkersLoading = true;

  bool isGetData = true;

  /// Color of the cluster circle
  final Color _clusterColor = Colors.blue;

  /// Color of the cluster text
  final Color _clusterTextColor = Colors.white;

  /// Example marker coordinates

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/map_pins.png');
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/map_pins.png.png');
  }

  void onMapCreated2(GoogleMapController controller) {
    controller.setMapStyle(Utils.mapStyles);
    _mapController.complete(controller);
    setMapPins();
    setPolylines();
  }

  setPolylines() async {
    List<PointLatLng> result = await polylinePoints?.getRouteBetweenCoordinates(
        'AIzaSyACxKN2mbFIStANEfvIbGZDrzrer2o-6d0',
        SOURCE_LOCATION.latitude,
        SOURCE_LOCATION.longitude,
        DEST_LOCATION.latitude,
        DEST_LOCATION.longitude);
    if (result.isNotEmpty) {
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
          polylineId: PolylineId("poly"),
          color: Color.fromARGB(255, 40, 122, 198),
          points: polylineCoordinates);

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
  }

  void setMapPins() {
    setState(() {
      // source pin
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: SOURCE_LOCATION,
          icon: sourceIcon));
      // destination pin
      _markers.add(Marker(
          markerId: MarkerId('destPin'),
          position: DEST_LOCATION,
          icon: destinationIcon));
    });
  }

  @override
  void initState() {
    // this.getMarkers();
    setSourceAndDestinationIcons();
    super.initState();
  }

  void _onMapCreated(
      GoogleMapController controller,
      List<LatLng> _markerLocations,
      List<String> _markerImageUrl,
      List<Belt> belt) {
    _mapController.complete(controller);

    setState(() {
      _isMapLoading = false;
    });

    _initMarkers(_markerLocations, _markerImageUrl, belt);
  }

  /// Inits [Fluster] and all the markers with network images and updates the loading state.
  void _initMarkers(List<LatLng> _markerLocations, List<String> _markerImageUrl,
      List<Belt> belt) async {
    final List<MapMarker> markers = [];

    for (LatLng markerLocation in _markerLocations) {
      // _markerLocations.asMap().forEach((index, value) async {
      final BitmapDescriptor markerImage =
          await MapServices.getMarkerImageFromUrl(
              _markerImageUrl[_markerLocations.indexOf(markerLocation)]);

      markers.add(
        MapMarker(
            id: _markerLocations.indexOf(markerLocation).toString(),
            position: markerLocation,
            icon: markerImage,
            onTap: () {
              _settingModalBottomSheet(
                  context, belt[_markerLocations.indexOf(markerLocation)]);
            }),
      );
      // });
    }

    _clusterManager = await MapServices.initClusterManager(
      markers,
      _minClusterZoom,
      _maxClusterZoom,
    );

    await _updateMarkers();
  }

  Future<String> getJsonFile() async {
    return await rootBundle.loadString('assets/masSetting.json');
  }

  /// Gets the markers and clusters to be displayed on the map for the current zoom level and
  /// updates state.
  Future<void> _updateMarkers([double updatedZoom]) async {
    if (_clusterManager == null || updatedZoom == _currentZoom) return;

    if (updatedZoom != null) {
      _currentZoom = updatedZoom;
    }

    setState(() {
      _areMarkersLoading = true;
    });

    final updatedMarkers = await MapServices.getClusterMarkers(
      _clusterManager,
      _currentZoom,
      _clusterColor,
      _clusterTextColor,
      60,
    );

    _markers
      ..clear()
      ..addAll(updatedMarkers);

    setState(() {
      _areMarkersLoading = false;
    });
  }

  Widget imageCarousel = new Container(
    child: Carousel(
      boxFit: BoxFit.cover,
      images: [AssetImage('assets/marketplace.png')],
      autoplay: true,
    ),
  );

  void _settingModalBottomSheet(context, Belt belt) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return new Container(
            height: 450.0,
            color: Color(0xFF737373),
            child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(15.0),
                      topRight: const Radius.circular(15.0))),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.grey,
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    width: 80,
                    height: 5,
                  ),
                  Container(
                    height: 140,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: belt.tenantLogo,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              SpinKitRipple(color: mainColorRed, size: 50),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  belt.tenantName,
                                  style: titleStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            margin: EdgeInsets.all(defaultMargin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                (belt.toilet)
                                    ? IconMap('assets/images/icon-toilet.png',
                                        'Toilet')
                                    : SizedBox(),
                                (belt.parkir)
                                    ? IconMap('assets/images/icon-parkir.png',
                                        'Parkir')
                                    : SizedBox(),
                                (belt.mushola)
                                    ? IconMap('assets/images/icon-mushola.png',
                                        'Mushola')
                                    : SizedBox(),
                                (belt.showroom)
                                    ? IconMap('assets/images/icon-showroom.png',
                                        'Showroom')
                                    : SizedBox(),
                              ],
                            )),
                        IconWithText(
                          icon: FontAwesome.map_marker,
                          text: belt.alamat,
                        ),
                        IconWithText(
                          icon: FontAwesome.phone,
                          text: belt.noTelp,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            // var result = await ProductServices.getMarketPlace(
                            //     widget.product.produkId);
                            // for (final i in result.value) {
                            //   var productMap = {
                            //     'id': i.urlNm,
                            //     'imageUrl': i.img,
                            //   };
                            //   marketplace.add(productMap);
                            // }
                            // context
                            //     .bloc<BisnisBloc>()
                            //     .add(FetchBisnis(belt.id));
                            // Get.to(WorkshopDetail('jj'));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Lihat Produk ",
                                style: normalFontStyle.copyWith(
                                    decoration: TextDecoration.underline,
                                    color: mainColorRed),
                              ),
                              Icon(
                                FontAwesome.external_link,
                                size: 15,
                                color: mainColorRed,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BlocBuilder<BeltBloc, BeltState>(
          builder: (_, beltState) {
            if (beltState is BeltLoaded) {
              ApiReturnValue<List<Belt>> belts = beltState.belts;
              final List<LatLng> _markerLocations = [];
              final List<String> _markerImageUrl = [];

              print(belts.value);

              if (belts.value != null) {
                belts.value.asMap().forEach((key, value) {
                  var lat = double.parse(value.latitude);
                  var long = double.parse(value.longitude);
                  _markerLocations.add(LatLng(lat, long));
                  _markerImageUrl.add(value.marker);
                });
              }

              return Opacity(
                opacity: _isMapLoading ? 0 : 1,
                child: new GoogleMap(
                  mapToolbarEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(-6.9218518, 107.6048254),
                    zoom: _currentZoom,
                  ),
                  markers: _markers,
                  onMapCreated: (controller) => _onMapCreated(controller,
                      _markerLocations, _markerImageUrl, belts.value),
                  onCameraMove: (position) => _updateMarkers(position.zoom),
                ),
              );
            } else {
              return Center(
                child: SpinKitRipple(
                  color: mainColorRed,
                  size: 50,
                ),
              );
            }
          },
        ),
        // Map loading indicator
        Opacity(
          opacity: _isMapLoading ? 1 : 0,
          child: Center(
              child: SpinKitRipple(
            color: mainColorRed,
            size: 50,
          )),
        ),

        // Map markers loading indicator
        if (_areMarkersLoading)
          Center(
              child: SpinKitRipple(
            color: mainColorRed,
            size: 50,
          )),
        Positioned(
          top: 20,
          right: defaultMargin,
          left: defaultMargin,
          child: SafeArea(
            child: InkWell(
              onTap: () {
                Get.to(SearchBoxBelt());
              },
              child: NeuBorder(
                mTop: 0,
                mBot: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Text(
                        "Cari ...",
                        style: normalFontStyle.copyWith(
                            color: Colors.grey, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: defaultMargin),
                      child: Icon(Icons.search, color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Utils {
  static String mapStyles = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]''';
}
