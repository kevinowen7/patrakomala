part of 'models.dart';

class Acara extends Equatable {
  Acara({
    this.id,
    this.title,
    this.description,
    this.takePlace,
    this.startTime,
    this.createdAt,
    this.updatedAt,
    this.startDate,
    this.eventContentType,
    this.endTime,
    this.endDate,
    this.status,
    this.isActive,
    this.approved,
    this.reason,
    this.rsvf,
    this.customUrl,
    this.slug,
    this.titleEng,
    this.descriptionEng,
    this.takePlaceEng,
    this.documents,
    this.banner,
    this.imgEvent,
  });

  final int id;
  final String title;
  final String description;
  final String takePlace;
  final String startTime;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime startDate;
  final String eventContentType;
  final String endTime;
  final DateTime endDate;
  final String status;
  final bool isActive;
  final String approved;
  final String reason;
  final bool rsvf;
  final String customUrl;
  final String slug;
  final String titleEng;
  final String descriptionEng;
  final String takePlaceEng;
  final String documents;
  final String banner;
  final List imgEvent;

  factory Acara.fromJson(json) => Acara(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        takePlace: json["take_place"],
        startTime: json["start_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        startDate: DateTime.parse(json["start_date"]),
        eventContentType: json["event_content_type"],
        endTime: json["end_time"] == null ? null : json["end_time"],
        endDate: DateTime.parse(json["end_date"]),
        status: json["status"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        approved: json["approved"] == null ? null : json["approved"],
        reason: json["reason"],
        rsvf: json["rsvf"],
        customUrl: json["custom_url"] == null ? null : json["custom_url"],
        slug: json["slug"] == null ? null : json["slug"],
        titleEng: json["title_eng"] == null ? null : json["title_eng"],
        descriptionEng:
            json["description_eng"] == null ? null : json["description_eng"],
        takePlaceEng:
            json["take_place_eng"] == null ? null : json["take_place_eng"],
        documents: json["documents"],
        banner: json["banner"],
        imgEvent: (json["img_event"] as List).toList(),
      );

  @override
  List<Object> get props => [
        id,
        title,
        description,
        takePlace,
        startTime,
        createdAt,
        updatedAt,
        startDate,
        eventContentType,
        endTime,
        endDate,
        status,
        isActive,
        approved,
        reason,
        rsvf,
        customUrl,
        slug,
        titleEng,
        descriptionEng,
        takePlaceEng,
        documents,
        banner,
        imgEvent,
      ];
}
