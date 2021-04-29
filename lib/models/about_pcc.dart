part of 'models.dart';

class AboutPcc extends Equatable {
  AboutPcc({
    this.id,
    this.text,
    this.flag,
  });

  final int id;
  final String text;
  final String flag;

  factory AboutPcc.fromJson(Map<String, dynamic> json) => AboutPcc(
        id: json["id"],
        text: json["text"],
        flag: json["flag"],
      );

  @override
  List<Object> get props => [
        id,
        text,
        flag,
      ];
}
