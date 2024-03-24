// import 'dart:convert';

// class SubjectResponseModel {
//     final List<Subject> data;

//     SubjectResponseModel({
//         required this.data,
//     });

//     factory SubjectResponseModel.fromJson(String str) => SubjectResponseModel.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory SubjectResponseModel.fromMap(Map<String, dynamic> json) => SubjectResponseModel(
//         data: List<Subject>.from(json["data"].map((x) => Subject.fromMap(x))),
//     );

//     Map<String, dynamic> toMap() => {
//         "data": List<dynamic>.from(data.map((x) => x.toMap())),
//     };
// }

// class Subject {
//     final int id;
//     final String title;
//     final int lecturerId;
//     final String semester;
//     final String academicYear;
//     final int credit;
//     final String code;
//     final String description;
//     final DateTime createdAt;
//     final DateTime updatedAt;
//     final List<Lesson> lessons;

//     Subject({
//         required this.id,
//         required this.title,
//         required this.lecturerId,
//         required this.semester,
//         required this.academicYear,
//         required this.credit,
//         required this.code,
//         required this.description,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.lessons,
//     });

//     factory Subject.fromJson(String str) => Subject.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Subject.fromMap(Map<String, dynamic> json) => Subject(
//         id: json["id"],
//         title: json["title"],
//         lecturerId: json["lecturer_id"],
//         semester: json["semester"],
//         academicYear: json["academic_year"],
//         credit: json["credit"],
//         code: json["code"],
//         description: json["description"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         lessons: List<Lesson>.from(json["lessons"].map((x) => Lesson.fromMap(x))),
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id,
//         "title": title,
//         "lecturer_id": lecturerId,
//         "semester": semester,
//         "academic_year": academicYear,
//         "credit": credit,
//         "code": code,
//         "description": description,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "lessons": List<dynamic>.from(lessons.map((x) => x.toMap())),
//     };
// }

// class Lesson {
//     final int id;
//     final int subjectId;
//     final String title;
//     final String subtitle;
//     final String minutes;
//     final String seconds;
//     final String description;
//     final String youtubeLink;
//     final DateTime createdAt;
//     final DateTime updatedAt;

//     Lesson({
//         required this.id,
//         required this.subjectId,
//         required this.title,
//         required this.subtitle,
//         required this.minutes,
//         required this.seconds,
//         required this.description,
//         required this.youtubeLink,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory Lesson.fromJson(String str) => Lesson.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory Lesson.fromMap(Map<String, dynamic> json) => Lesson(
//         id: json["id"],
//         subjectId: json["subject_id"],
//         title: json["title"],
//         subtitle: json["subtitle"],
//         minutes: json["minutes"],
//         seconds: json["seconds"],
//         description: json["description"],
//         youtubeLink: json["youtube_link"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id,
//         "subject_id": subjectId,
//         "title": title,
//         "subtitle": subtitle,
//         "minutes": minutes,
//         "seconds": seconds,
//         "description": description,
//         "youtube_link": youtubeLink,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }

import 'dart:convert';

class SubjectResponseModel {
    final List<Subject> data;

    SubjectResponseModel({
        required this.data,
    });

    factory SubjectResponseModel.fromJson(String str) => SubjectResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SubjectResponseModel.fromMap(Map<String, dynamic> json) => SubjectResponseModel(
        data: List<Subject>.from(json["data"].map((x) => Subject.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Subject {
    final int id;
    final String title;
    final int lecturerId;
    final String semester;
    final String academicYear;
    final int credit;
    final String code;
    final String description;
    final DateTime createdAt;
    final DateTime updatedAt;
    final List<Lesson> lessons;
    final Lecturer lecturer;

    Subject({
        required this.id,
        required this.title,
        required this.lecturerId,
        required this.semester,
        required this.academicYear,
        required this.credit,
        required this.code,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
        required this.lessons,
        required this.lecturer,
    });

    factory Subject.fromJson(String str) => Subject.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Subject.fromMap(Map<String, dynamic> json) => Subject(
        id: json["id"],
        title: json["title"],
        lecturerId: json["lecturer_id"],
        semester: json["semester"],
        academicYear: json["academic_year"],
        credit: json["credit"],
        code: json["code"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        lessons: List<Lesson>.from(json["lessons"].map((x) => Lesson.fromMap(x))),
        lecturer: Lecturer.fromMap(json["lecturer"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "lecturer_id": lecturerId,
        "semester": semester,
        "academic_year": academicYear,
        "credit": credit,
        "code": code,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "lessons": List<dynamic>.from(lessons.map((x) => x.toMap())),
        "lecturer": lecturer.toMap(),
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
    final String minutes;
    final String seconds;
    final String description;
    final String youtubeLink;
    final DateTime createdAt;
    final DateTime updatedAt;

    Lesson({
        required this.id,
        required this.subjectId,
        required this.title,
        required this.subtitle,
        required this.minutes,
        required this.seconds,
        required this.description,
        required this.youtubeLink,
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
        minutes: json["minutes"],
        seconds: json["seconds"],
        description: json["description"],
        youtubeLink: json["youtube_link"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "subject_id": subjectId,
        "title": title,
        "subtitle": subtitle,
        "minutes": minutes,
        "seconds": seconds,
        "description": description,
        "youtube_link": youtubeLink,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
