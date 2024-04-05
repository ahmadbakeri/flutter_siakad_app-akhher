import 'dart:convert';

class CourseResponseModel {
    final List<Course> data;

    CourseResponseModel({
        required this.data,
    });

    factory CourseResponseModel.fromJson(String str) => CourseResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CourseResponseModel.fromMap(Map<String, dynamic> json) => CourseResponseModel(
        data: List<Course>.from(json["data"].map((x) => Course.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Course {
    final int id;
    final String title;
    final String subtitle;
    final String CourseClass;
    final String time;
    final String image;
    final DateTime createdAt;
    final DateTime updatedAt;
    final List<Subject> subjects;

    Course({
        required this.id,
        required this.title,
        required this.subtitle,
        required this.CourseClass,
        required this.time,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.subjects,
    });

    factory Course.fromJson(String str) => Course.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Course.fromMap(Map<String, dynamic> json) => Course(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        CourseClass: json["class"],
        time: json["time"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subjects: List<Subject>.from(json["subjects"].map((x) => Subject.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "class": CourseClass,
        "time": time,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subjects": List<dynamic>.from(subjects.map((x) => x.toMap())),
    };
}

class Subject {
    final int id;
    final int lecturerId;
    final int courseId;
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

    Subject({
        required this.id,
        required this.lecturerId,
        required this.courseId,
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

    factory Subject.fromJson(String str) => Subject.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Subject.fromMap(Map<String, dynamic> json) => Subject(
        id: json["id"],
        lecturerId: json["lecturer_id"],
        courseId: json["course_id"],
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
        "lecturer_id": lecturerId,
        "course_id": courseId,
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
    final String description;
    final String youtubeLink;
    final String gdriveLink;
    final DateTime createdAt;
    final DateTime updatedAt;

    Lesson({
        required this.id,
        required this.subjectId,
        required this.title,
        required this.subtitle,
        required this.time,
        required this.description,
        required this.youtubeLink,
        required this.gdriveLink,
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
        description: json["description"],
        youtubeLink: json["youtube_link"],
        gdriveLink: json["gdrive_link"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "subject_id": subjectId,
        "title": title,
        "subtitle": subtitle,
        "time": time,
        "description": description,
        "youtube_link": youtubeLink,
        "gdrive_link": gdriveLink,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
