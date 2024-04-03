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
    final DateTime createdAt;
    final DateTime updatedAt;
    final String image;
    final String title;
    final String subtitle;
    final String time;
    final List<Subject> subjects;

    Course({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.image,
        required this.title,
        required this.subtitle,
        required this.time,
        required this.subjects,
    });

    factory Course.fromJson(String str) => Course.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Course.fromMap(Map<String, dynamic> json) => Course(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
        title: json["title"],
        subtitle: json["subtitle"],
        time: json["time"],
        subjects: List<Subject>.from(json["subjects"].map((x) => Subject.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
        "title": title,
        "subtitle": subtitle,
        "time": time,
        "subjects": List<dynamic>.from(subjects.map((x) => x.toMap())),
    };
}

class Subject {
    final int id;
    final String title;
    final int lecturerId;
    final int courseId;
    final String semester;
    final String academicYear;
    final int credit;
    final String code;
    final String description;
    final DateTime createdAt;
    final DateTime updatedAt;
    final Lecturer lecturer;
    final List<Lesson> lessons;

    Subject({
        required this.id,
        required this.title,
        required this.lecturerId,
        required this.courseId,
        required this.semester,
        required this.academicYear,
        required this.credit,
        required this.code,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
        required this.lecturer,
        required this.lessons,
    });

    factory Subject.fromJson(String str) => Subject.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Subject.fromMap(Map<String, dynamic> json) => Subject(
        id: json["id"],
        title: json["title"],
        lecturerId: json["lecturer_id"],
        courseId: json["course_id"],
        semester: json["semester"],
        academicYear: json["academic_year"],
        credit: json["credit"],
        code: json["code"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        lecturer: Lecturer.fromMap(json["lecturer"]),
        lessons: List<Lesson>.from(json["lessons"].map((x) => Lesson.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "lecturer_id": lecturerId,
        "course_id": courseId,
        "semester": semester,
        "academic_year": academicYear,
        "credit": credit,
        "code": code,
        "description": description,
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
