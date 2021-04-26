part of 'models.dart';

class BeltPackage extends Equatable {
  BeltPackage({
    this.id,
    this.beltTitle,
  });

  final int id;
  final String beltTitle;

  BeltPackage copyWith({
    int id,
    String beltTitle,
  }) =>
      BeltPackage(
        id: id ?? this.id,
        beltTitle: beltTitle ?? this.beltTitle,
      );

  factory BeltPackage.fromJson(data) => BeltPackage(
        id: data['id'],
        beltTitle: data['belt_title'],
      );

  @override
  List<Object> get props => [id, beltTitle];
}
