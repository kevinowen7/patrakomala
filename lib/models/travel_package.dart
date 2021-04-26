part of 'models.dart';

class TravelPackage extends Equatable {
  TravelPackage({
    this.id,
    this.packageName,
  });

  final int id;
  final String packageName;

  TravelPackage copyWith({
    int id,
    String packageName,
  }) =>
      TravelPackage(
        id: id ?? this.id,
        packageName: packageName ?? this.packageName,
      );

  factory TravelPackage.fromJson(data) => TravelPackage(
        id: data['id'],
        packageName: data['package_name'],
      );

  @override
  List<Object> get props => [
        id,
        packageName,
      ];
}
