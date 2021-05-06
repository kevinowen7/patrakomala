part of 'services.dart';

class MapServices {
  static Future<ApiReturnValue<List<Belt>>> getBelt(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/belts';
    var response =
        await client.get(url, headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Gagal mengambil belts");
    }

    var data = aConvert.jsonDecode(response.body);
    List<Belt> value =
        (data['response'] as Iterable).map((e) => Belt.fromJson(e)).toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<Belt>>> beltBySubsector(List<int> subsector,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/belts/subsector';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert.jsonEncode({
          'subsector': subsector,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Gagal mengambil belts");
    }

    var data = aConvert.jsonDecode(response.body);

    List<Belt> value =
        (data['response'] as Iterable).map((e) => Belt.fromJson(e)).toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<Belt>>> beltByKecamatan(int kecamatanId,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/belts/kecamatan';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert.jsonEncode({
          'kecamatan': kecamatanId,
        }));

    // print(res);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Gagal mengambil belts");
    }

    var data = aConvert.jsonDecode(response.body);
    List<Belt> value =
        (data['response'] as Iterable).map((e) => Belt.fromJson(e)).toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<Belt>>> beltByKelurahan(int kelurahanId,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/belts/kelurahan';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert.jsonEncode({
          'kelurahan': kelurahanId,
        }));

    // print(res);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Gagal mengambil belts");
    }

    var data = aConvert.jsonDecode(response.body);
    List<Belt> value =
        (data['response'] as Iterable).map((e) => Belt.fromJson(e)).toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<Belt>>> beltPackages(List<int> belts,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'v1/tour-package/filter-package';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert.jsonEncode({
          'filter': {
            'belt': belts,
          },
        }));

    // print(response.statusCode.toString());
    // print(belts);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Gagal mengambil belts");
    }

    var data = aConvert.jsonDecode(response.body);
    print(data['status'].toString());

    if (data['status'] == 'failed') {
      return ApiReturnValue(value: []);
    } else {
      List<Belt> value =
          (data['data'] as Iterable).map((e) => Belt.fromJson(e)).toList();

      return ApiReturnValue(value: value);
    }
  }

  static Future<ApiReturnValue<List<Belt>>> tourPackages(int package,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'v1/tour-package/filter-package';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert.jsonEncode({
          'filter': {
            'package': package,
          },
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Gagal mengambil belts");
    }

    var data = aConvert.jsonDecode(response.body);
    List<Belt> value =
        (data['data'] as Iterable).map((e) => Belt.fromJson(e)).toList();

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<Belt>>> filter3(
      List<int> subsector, int kecamatanID, int kelurahanID,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL2 + 'mobile/belts/filter';
    var response = await client.post(url,
        headers: {"Content-Type": "application/json"},
        body: aConvert.jsonEncode({
          'kecamatan': kecamatanID,
          'kelurahan': kelurahanID,
          'subsector': subsector,
        }));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Gagal");
    }

    var data = aConvert.jsonDecode(response.body);
    print(data['response'].length.toString());
    List<Belt> value =
        (data['response'] as Iterable).map((e) => Belt.fromJson(e)).toList();
    return ApiReturnValue(value: value);
  }

    // static Future<ApiReturnValue<s


  static Future<BitmapDescriptor> getMarkerImageFromUrl(
    String url, {
    int targetWidth,
  }) async {
    assert(url != null);

    final File markerImageFile = await DefaultCacheManager().getSingleFile(url);

    Uint8List markerImageBytes = await markerImageFile.readAsBytes();

    if (targetWidth != null) {
      markerImageBytes = await _resizeImageBytes(
        markerImageBytes,
        targetWidth,
      );
    }

    return BitmapDescriptor.fromBytes(markerImageBytes);
  }


  /// Draw a [clusterColor] circle with the [clusterSize] text inside that is [width] wide.
  ///
  /// Then it will convert the canvas to an image and generate the [BitmapDescriptor]
  /// to be used on the cluster marker icons.
  static Future<BitmapDescriptor> _getClusterMarker(
    int clusterSize,
    Color clusterColor,
    Color textColor,
    int width,
  ) async {
    assert(clusterSize != null);
    assert(clusterColor != null);
    assert(width != null);

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = clusterColor;
    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    final double radius = width / 2;

    canvas.drawCircle(
      Offset(radius, radius),
      radius,
      paint,
    );

    textPainter.text = TextSpan(
      text: clusterSize.toString(),
      style: TextStyle(
        fontSize: radius - 5,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(radius - textPainter.width / 2, radius - textPainter.height / 2),
    );

    final image = await pictureRecorder.endRecording().toImage(
          radius.toInt() * 2,
          radius.toInt() * 2,
        );
    final data = await image.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }

  /// Resizes the given [imageBytes] with the [targetWidth].
  ///
  /// We don't want the marker image to be too big so we might need to resize the image.
  static Future<Uint8List> _resizeImageBytes(
    Uint8List imageBytes,
    int targetWidth,
  ) async {
    assert(imageBytes != null);
    assert(targetWidth != null);

    final Codec imageCodec = await instantiateImageCodec(
      imageBytes,
      targetWidth: targetWidth,
    );

    final FrameInfo frameInfo = await imageCodec.getNextFrame();

    final ByteData byteData = await frameInfo.image.toByteData(
      format: ImageByteFormat.png,
    );

    return byteData.buffer.asUint8List();
  }

  /// Inits the cluster manager with all the [MapMarker] to be displayed on the map.
  /// Here we're also setting up the cluster marker itself, also with an [clusterImageUrl].
  ///
  /// For more info about customizing your clustering logic check the [Fluster] constructor.
  static Future<Fluster<MapMarker>> initClusterManager(
    List<MapMarker> markers,
    int minZoom,
    int maxZoom,
  ) async {
    assert(markers != null);
    assert(minZoom != null);
    assert(maxZoom != null);

    return Fluster<MapMarker>(
      minZoom: minZoom,
      maxZoom: maxZoom,
      radius: 500,
      extent: 2048,
      nodeSize: 64,
      points: markers,
      createCluster: (
        BaseCluster cluster,
        double lng,
        double lat,
      ) =>
          MapMarker(
        id: cluster.id.toString(),
        position: LatLng(lat, lng),
        isCluster: cluster.isCluster,
        clusterId: cluster.id,
        pointsSize: cluster.pointsSize,
        childMarkerId: cluster.childMarkerId,
        onTap: null,
      ),
    );
  }

  /// Gets a list of markers and clusters that reside within the visible bounding box for
  /// the given [currentZoom]. For more info check [Fluster.clusters].
  static Future<List<Marker>> getClusterMarkers(
    Fluster<MapMarker> clusterManager,
    double currentZoom,
    Color clusterColor,
    Color clusterTextColor,
    int clusterWidth,
  ) {
    assert(currentZoom != null);
    assert(clusterColor != null);
    assert(clusterTextColor != null);
    assert(clusterWidth != null);

    if (clusterManager == null) return Future.value([]);

    return Future.wait(clusterManager.clusters(
        [-180, -85, 180, 85], currentZoom.toInt()).map((mapMarker) async {
      if (mapMarker.isCluster) {
        mapMarker.icon = await _getClusterMarker(
          mapMarker.pointsSize,
          clusterColor,
          clusterTextColor,
          clusterWidth,
        );
      }

      return mapMarker.toMarker();
    }).toList());
  }
}
