part of 'models.dart';

class MapMarker extends Clusterable {
  final String id;
  final LatLng position;
  final Function onTap;
  BitmapDescriptor icon;

  MapMarker({
    @required this.id,
    @required this.position,
    @required this.onTap,
    this.icon,
    isCluster = false,
    clusterId,
    pointsSize,
    childMarkerId,
  }) : super(
          markerId: id,
          latitude: position.latitude,
          longitude: position.longitude,
          isCluster: isCluster,
          clusterId: clusterId,
          pointsSize: pointsSize,
          childMarkerId: childMarkerId,
        );

  Marker toMarker() => Marker(
        onTap: onTap,
        markerId: MarkerId(isCluster ? 'cl_$id' : id),
        position: LatLng(
          position.latitude,
          position.longitude,
        ),
        icon: icon,
      );
}
