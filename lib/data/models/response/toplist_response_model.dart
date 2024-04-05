import 'dart:convert';

class ToplistResponseModel {
    final List<Toplist> data;

    ToplistResponseModel({
        required this.data,
    });

    factory ToplistResponseModel.fromJson(String str) => ToplistResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ToplistResponseModel.fromMap(Map<String, dynamic> json) => ToplistResponseModel(
        data: List<Toplist>.from(json["data"].map((x) => Toplist.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Toplist {
    final int id;
    final DateTime createdAt;
    final DateTime updatedAt;
    final TopSubject subject;

    Toplist({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.subject,
    });

    factory Toplist.fromJson(String str) => Toplist.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Toplist.fromMap(Map<String, dynamic> json) => Toplist(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subject: TopSubject.fromMap(json["subject"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subject": subject.toMap(),
    };
}

class TopSubject {
    final int id;
    final int courseId;
    final int toplistId;
    final int lecturerId;
    final String title;
    final String subtitle;
    final String time;
    final String field;
    final String description;
    final String image;
    final DateTime createdAt;
    final DateTime updatedAt;
    final Lecturer lecturer;
    final List<Lesson> lessons;

    TopSubject({
        required this.id,
        required this.courseId,
        required this.toplistId,
        required this.lecturerId,
        required this.title,
        required this.subtitle,
        required this.time,
        required this.field,
        required this.description,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.lecturer,
        required this.lessons,
    });

    factory TopSubject.fromJson(String str) => TopSubject.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TopSubject.fromMap(Map<String, dynamic> json) => TopSubject(
        id: json["id"],
        courseId: json["course_id"],
        toplistId: json["toplist_id"],
        lecturerId: json["lecturer_id"],
        title: json["title"],
        subtitle: json["subtitle"],
        time: json["time"],
        field: json["field"],
        description: json["description"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        lecturer: Lecturer.fromMap(json["lecturer"]),
        lessons: List<Lesson>.from(json["lessons"].map((x) => Lesson.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "course_id": courseId,
        "toplist_id": toplistId,
        "lecturer_id": lecturerId,
        "title": title,
        "subtitle": subtitle,
        "time": time,
        "field": field,
        "description": description,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "lecturer": lecturer.toMap(),
        "lessons": List<dynamic>.from(lessons.map((x) => x.toMap())),
    };
}

class Lecturer {
    final int id;
    final String name;
    final String email;
    final String roles;
    final dynamic phone;
    final dynamic address;
    final DateTime emailVerifiedAt;
    final dynamic twoFactorSecret;
    final dynamic twoFactorRecoveryCodes;
    final dynamic twoFactorConfirmedAt;
    final DateTime createdAt;
    final DateTime updatedAt;

    Lecturer({
        required this.id,
        required this.name,
        required this.email,
        required this.roles,
        required this.phone,
        required this.address,
        required this.emailVerifiedAt,
        required this.twoFactorSecret,
        required this.twoFactorRecoveryCodes,
        required this.twoFactorConfirmedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Lecturer.fromJson(String str) => Lecturer.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Lecturer.fromMap(Map<String, dynamic> json) => Lecturer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        roles: json["roles"],
        phone: json["phone"],
        address: json["address"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "roles": roles,
        "phone": phone,
        "address": address,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Lesson {
    final int id;
    final int subjectId;
    final String title;
    final String subtitle;
    final String time;
    final String youtubeLink;
    final String gdriveLink;
    final String description;
    final DateTime createdAt;
    final DateTime updatedAt;

    Lesson({
        required this.id,
        required this.subjectId,
        required this.title,
        required this.subtitle,
        required this.time,
        required this.youtubeLink,
        required this.gdriveLink,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Lesson.fromJson(String str) => Lesson.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Lesson.fromMap(Map<String, dynamic> json) => Lesson(
        id: json["id"],
        subjectId: json["subject_id"],
        title: json["title"],
        subtitle: json["subtitle"],
        time: json["time"],
        youtubeLink: json["youtube_link"],
        gdriveLink: json["gdrive_link"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "subject_id": subjectId,
        "title": title,
        "subtitle": subtitle,
        "time": time,
        "youtube_link": youtubeLink,
        "gdrive_link": gdriveLink,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
