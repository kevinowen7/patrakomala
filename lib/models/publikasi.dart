part of 'models.dart';

class Publikasi extends Equatable {
  Publikasi({
    this.id,
    this.title,
    this.description,
    this.documents,
  });

  final int id;
  final String title;
  final String description;
  final String documents;

  factory Publikasi.fromJson(Map<String, dynamic> json) => Publikasi(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        documents: json["documents"],
      );

  @override
  List<Object> get props => throw [id, title, description, documents];
}
