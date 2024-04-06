import 'dart:convert';

class ScheduleResponseModel {
    final List<Schedule> data;

    ScheduleResponseModel({
        required this.data,
    });

    factory ScheduleResponseModel.fromJson(String str) => ScheduleResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ScheduleResponseModel.fromMap(Map<String, dynamic> json) => ScheduleResponseModel(
        data: List<Schedule>.from(json["data"].map((x) => Schedule.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Schedule {
    final int id;
    final int subjectId;
    final int studentId;
    final String day;
    final String startTime;
    final String endTime;
    final String room;
    final String attendanceCode;
    final String academicYear;
    final String semester;
    final String createdBy;
    final String updatedBy;
    final dynamic deletedBy;
    final DateTime createdAt;
    final DateTime updatedAt;
    final Subject subject;

    Schedule({
        required this.id,
        required this.subjectId,
        required this.studentId,
        required this.day,
        required this.startTime,
        required this.endTime,
        required this.room,
        required this.attendanceCode,
        required this.academicYear,
        required this.semester,
        required this.createdBy,
        required this.updatedBy,
        required this.deletedBy,
        required this.createdAt,
        required this.updatedAt,
        required this.subject,
    });

    factory Schedule.fromJson(String str) => Schedule.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Schedule.fromMap(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        subjectId: json["subject_id"],
        studentId: json["student_id"],
        day: json["day"],
        startTime: json["start_time"],
        endTime: json["end_time"],
        room: json["room"],
        attendanceCode: json["attendance_code"],
        academicYear: json["academic_year"],
        semester: json["semester"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subject: Subject.fromMap(json["subject"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "subject_id": subjectId,
        "student_id": studentId,
        "day": day,
        "start_time": startTime,
        "end_time": endTime,
        "room": room,
        "attendance_code": attendanceCode,
        "academic_year": academicYear,
        "semester": semester,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subject": subject.toMap(),
    };
}

class Subject {
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

    Subject({
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
    });

    factory Subject.fromJson(String str) => Subject.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Subject.fromMap(Map<String, dynamic> json) => Subject(
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
