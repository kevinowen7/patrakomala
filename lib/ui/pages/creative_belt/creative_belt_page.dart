part of '../pages.dart';

class CreativeBeltPage extends StatefulWidget {
  @override
  _CreativeBeltPageState createState() => _CreativeBeltPageState();
}

class _CreativeBeltPageState extends State<CreativeBeltPage> {
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

  @override
  void initState() {
    // this.getMarkers();
    super.initState();
  }

  // void getMarkers() async {
  //   var result = await MapServices.getBelt();
  //   var belts = result.value.sublist(0, 100);
  //   belts.asMap().forEach((index, value) {
  //     var lat = double.parse(value.latitude);
  //     var long = double.parse(value.longitude);
  //     setState(() {
  //       _markerLocations.add(LatLng(lat, long));
  //       _markerImageUrl.add(value.marker);
  //     });
  //   });
  //   setState(() {
  //     isGetData = false;
  //   });
  // }

  /// Called when the Google Map widget is created. Updates the map loading state
  /// and inits the markers.
  void _onMapCreated(GoogleMapController controller,
      List<LatLng> _markerLocations, List<String> _markerImageUrl) {
    _mapController.complete(controller);

    setState(() {
      _isMapLoading = false;
    });

    _initMarkers(_markerLocations, _markerImageUrl);
  }

  /// Inits [Fluster] and all the markers with network images and updates the loading state.
  void _initMarkers(
      List<LatLng> _markerLocations, List<String> _markerImageUrl) async {
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
              _settingModalBottomSheet(context);
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

  void _settingModalBottomSheet(context) {
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
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment(-.2, 0),
                          image: NetworkImage(
                              'http://www.naturerights.com/blog/wp-content/uploads/2017/12/Taranaki-NR-post-1170x550.png'),
                          fit: BoxFit.cover),
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
                                  "Sample Workshop",
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
                                IconMap(
                                    'assets/images/icon-toilet.png', 'Toilet'),
                                IconMap(
                                    'assets/images/icon-parkir.png', 'Parkir'),
                                IconMap('assets/images/icon-mushola.png',
                                    'Mushola'),
                                IconMap('assets/images/icon-showroom.png',
                                    'Showroom'),
                              ],
                            )),

                        IconWithText(
                          icon: FontAwesome.map_marker,
                          text:
                              'Jl. Gatot Subroto No.289, Cibangkong, Kec. Batununggal, Kota Bandung, Jawa Barat 40273',
                        ),

                        IconWithText(
                          icon: FontAwesome.phone,
                          text: '08XXXXXXXXXX',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {},
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
                        // Container(
                        //   height: 40,
                        //   width: (MediaQuery.of(context).size.width) - 70,
                        //   decoration: BoxDecoration(
                        //     boxShadow: <BoxShadow>[
                        //       BoxShadow(
                        //         color: Color.fromRGBO(17, 18, 19, 0.3),
                        //         offset: Offset(0.0, 0.0),
                        //         blurRadius: 2.0,
                        //       ),
                        //     ],
                        //     gradient: RadialGradient(colors: [
                        //       "FEFEFE".toColor(),
                        //       "F8F8F8".toColor(),
                        //     ]),
                        //     borderRadius:
                        //         BorderRadius.all(const Radius.circular(5.0)),
                        //   ),
                        //   child: Center(
                        //     child: FlatButton(
                        //       color: Colors.transparent,
                        //       onPressed: null,
                        //       child: Container(
                        //         width: double.infinity,
                        //         child: marketPlaceButton(),
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
        // Google Map widget
        // (isGetData)
        //     ? SizedBox()
        //     : Opacity(
        //         opacity: _isMapLoading ? 0 : 1,
        //         child: GoogleMap(
        //           mapToolbarEnabled: false,
        //           initialCameraPosition: CameraPosition(
        //             target: LatLng(-6.9218518, 107.6048254),
        //             zoom: _currentZoom,
        //           ),
        //           markers: _markers,
        //           onMapCreated: (controller) => _onMapCreated(controller),
        //           onCameraMove: (position) => _updateMarkers(position.zoom),
        //         ),
        //       ),
        BlocBuilder<BeltBloc, BeltState>(
          builder: (_, beltState) {
            if (beltState is BeltLoaded) {
              ApiReturnValue<List<Belt>> belts = beltState.belts;
              final List<LatLng> _markerLocations = [];
              final List<String> _markerImageUrl = [];

              belts.value.asMap().forEach((key, value) {
                var lat = double.parse(value.latitude);
                var long = double.parse(value.longitude);
                _markerLocations.add(LatLng(lat, long));
                _markerImageUrl.add(value.marker);
              });

              return Opacity(
                opacity: _isMapLoading ? 0 : 1,
                child: GoogleMap(
                  mapToolbarEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(-6.9218518, 107.6048254),
                    zoom: _currentZoom,
                  ),
                  markers: _markers,
                  onMapCreated: (controller) => _onMapCreated(
                      controller, _markerLocations, _markerImageUrl),
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
        // (isGetData)
        //     ? Positioned(
        //         top: (MediaQuery.of(context).size.height) * 0.45,
        //         left: (MediaQuery.of(context).size.width) * 0.45,
        //         child: SpinKitRipple(
        //           color: mainColorRed,
        //           size: 70,
        //         ))
        //     : SizedBox(),

        Positioned(
          top: 20,
          right: defaultMargin,
          left: defaultMargin,
          child: SafeArea(
            child: InkWell(
              onTap: () async {
                _settingModalBottomSheet(context);
                // Get.to(SearchBoxBelt())m
                // final SharedPreferences sharedPreference =
                //     await SharedPreferences.getInstance();
                // sharedPreference.remove('identifier');
                // Get.to(PreLoginPage());
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
                        "Cari Lokasi, Produk ...",
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
