part of 'models.dart';

class News extends Equatable{
    News({
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
        this.userAppLoginId,
        this.userId,
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
    final bool userAppLoginId;
    final int userId;
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

    News copyWith({
        int id,
        String title,
        String description,
        String takePlace,
        String startTime,
        DateTime createdAt,
        DateTime updatedAt,
        DateTime startDate,
        String eventContentType,
        String endTime,
        DateTime endDate,
        String status,
        bool isActive,
        bool userAppLoginId,
        int userId,
        String approved,
        String reason,
        bool rsvf,
        String customUrl,
        String slug,
        String titleEng,
        String descriptionEng,
        String takePlaceEng,
        String documents,
        String banner,
        List imgEvent,
    }) => 
        News(
            id: id ?? this.id,
            title: title ?? this.title,
            description: description ?? this.description,
            takePlace: takePlace ?? this.takePlace,
            startTime: startTime ?? this.startTime,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            startDate: startDate ?? this.startDate,
            eventContentType: eventContentType ?? this.eventContentType,
            endTime: endTime ?? this.endTime,
            endDate: endDate ?? this.endDate,
            status: status ?? this.status,
            isActive: isActive ?? this.isActive,
            userAppLoginId: userAppLoginId ?? this.userAppLoginId,
            userId: userId ?? this.userId,
            approved: approved ?? this.approved,
            reason: reason ?? this.reason,
            rsvf: rsvf ?? this.rsvf,
            customUrl: customUrl ?? this.customUrl,
            slug: slug ?? this.slug,
            titleEng: titleEng ?? this.titleEng,
            descriptionEng: descriptionEng ?? this.descriptionEng,
            takePlaceEng: takePlaceEng ?? this.takePlaceEng,
            documents: documents ?? this.documents,
            banner: banner ?? this.banner,
            imgEvent: imgEvent ?? this.imgEvent,
        );

    factory News.fromMap(json) => News(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        takePlace: json["take_place"] == null ? null : json["take_place"],
        startTime: json["start_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        startDate: DateTime.parse(json["start_date"]),
        eventContentType: json["event_content_type"],
        endTime: json["end_time"],
        endDate: DateTime.parse(json["end_date"]),
        status: json["status"],
        isActive: json["is_active"],
        userAppLoginId: json["user_app_login_id"],
        userId: json["user_id"],
        approved: json["approved"],
        reason: json["reason"],
        rsvf: json["rsvf"],
        customUrl: json["custom_url"],
        slug: json["slug"],
        titleEng: json["title_eng"] == null ? null : json["title_eng"],
        descriptionEng: json["description_eng"],
        takePlaceEng: json["take_place_eng"],
        documents: json["documents"],
        banner: json["banner"] == null ? null : json["banner"],
        imgEvent: (json["img_event"] as List).toList(),
    );


  @override
  List<Object> get props => throw UnimplementedError();

}