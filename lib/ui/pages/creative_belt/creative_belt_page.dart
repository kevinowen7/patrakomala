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

  /// Url image used on normal markers
  final String _markerImageUrl =
      'https://img.icons8.com/office/80/000000/marker.png';

  /// Color of the cluster circle
  final Color _clusterColor = Colors.blue;

  /// Color of the cluster text
  final Color _clusterTextColor = Colors.white;

  /// Example marker coordinates
  final List<LatLng> _markerLocations = [
    LatLng(-6.9463964, 107.6018374),
    LatLng(-6.9218518, 107.6048254),
    LatLng(-6.9221981, 107.5996726),
    LatLng(-6.9225159, 107.6006059),
  ];

  /// Called when the Google Map widget is created. Updates the map loading state
  /// and inits the markers.
  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);

    setState(() {
      _isMapLoading = false;
    });

    _initMarkers();
  }

  /// Inits [Fluster] and all the markers with network images and updates the loading state.
  void _initMarkers() async {
    final List<MapMarker> markers = [];

    for (LatLng markerLocation in _markerLocations) {
      final BitmapDescriptor markerImage =
          await MapServices.getMarkerImageFromUrl(_markerImageUrl);

      markers.add(
        MapMarker(
            id: _markerLocations.indexOf(markerLocation).toString(),
            position: markerLocation,
            icon: markerImage,
            onTap: () {
              _settingModalBottomSheet(context);
            }),
      );
    }

    _clusterManager = await MapServices.initClusterManager(
      markers,
      _minClusterZoom,
      _maxClusterZoom,
    );

    await _updateMarkers();
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
      80,
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
      // dotSize: 4.0,
      // indicatorBgPadding: 2.0,
    ),
  );

  Widget marketPlaceButton() {
    return PopupMenuButton(
        // color: Colors.transparent,
        child: Text("MarketPlace",
            style: normalFontStyle.copyWith(color: mainColorRed),
            textAlign: TextAlign.center),
        onSelected: (value) {
          Fluttertoast.showToast(
              msg: "You have selected " + value.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Image.asset('assets/images/lazada.jpg',
                            width: 20, height: 20),
                      ),
                      Text('Lazada')
                    ],
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Image.asset('assets/images/tokped.png',
                            width: 20, height: 20),
                      ),
                      Text('Tokopedia')
                    ],
                  )),
              PopupMenuItem(
                  value: 3,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Image.asset('assets/images/shopee.png',
                            width: 20, height: 20),
                      ),
                      Text('Shopee')
                    ],
                  )),
            ]);
  }

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
                        IconWithText(
                          icon: FontAwesome.building,
                          text: 'Tolet, Parkir',
                        ),
                        IconWithText(
                          icon: FontAwesome.map_marker,
                          text:
                              'Jl. Gatot Subroto No.289, Cibangkong, Kec. Batununggal, Kota Bandung, Jawa Barat 40273',
                        ),
                        IconWithText(
                          icon: FontAwesome.clock_o,
                          text: '08:00 - 17:00',
                        ),
                        IconWithText(
                          icon: FontAwesome.phone,
                          text: '08XXXXXXXXXX',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await launch(
                                'https://www.figma.com/file/6n3L6wYhcbhRsHy6Bx4cPi/Patrakomala-v2?node-id=116%3A579');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Website ",
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
                        Container(
                          height: 40,
                          width: (MediaQuery.of(context).size.width) - 70,
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Color.fromRGBO(17, 18, 19, 0.3),
                                offset: Offset(0.0, 0.0),
                                blurRadius: 2.0,
                              ),
                            ],
                            gradient: RadialGradient(colors: [
                              "FEFEFE".toColor(),
                              "F8F8F8".toColor(),
                            ]),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(5.0)),
                          ),
                          child: Center(
                            child: FlatButton(
                              color: Colors.transparent,
                              onPressed: null,
                              child: Container(
                                width: double.infinity,
                                child: marketPlaceButton(),
                              ),
                            ),
                          ),
                        ),
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
        // Opacity(
        //   opacity: _isMapLoading ? 0 : 1,
        //   child: GoogleMap(
        //     mapToolbarEnabled: false,
        //     initialCameraPosition: CameraPosition(
        //       target: LatLng(-6.9218518, 107.6048254),
        //       zoom: _currentZoom,
        //     ),
        //     markers: _markers,
        //     onMapCreated: (controller) => _onMapCreated(controller),
        //     onCameraMove: (position) => _updateMarkers(position.zoom),
        //   ),
        // ),

        // Map loading indicator
        // Opacity(
        //   opacity: _isMapLoading ? 1 : 0,
        //   child: Center(child: CircularProgressIndicator()),
        // ),

        // Map markers loading indicator
        // if (_areMarkersLoading)
        //   Padding(`
        //     padding: const EdgeInsets.all(8.0),
        //     child: Align(
        //       alignment: Alignment.topCenter,
        //       child: Card(
        //         elevation: 2,
        //         color: Colors.grey.withOpacity(0.9),
        //         child: Padding(
        //           padding: const EdgeInsets.all(4),
        //           child: Text(
        //             'Loading',
        //             style: TextStyle(color: Colors.white),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),

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
