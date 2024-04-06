import 'dart:convert';

class AttendanceResponseModel {
    final List<Attendance> data;

    AttendanceResponseModel({
        required this.data,
    });

    factory AttendanceResponseModel.fromJson(String str) => AttendanceResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AttendanceResponseModel.fromMap(Map<String, dynamic> json) => AttendanceResponseModel(
        data: List<Attendance>.from(json["data"].map((x) => Attendance.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Attendance {
    final int id;
    final int scheduleId;
    final int studentId;
    final String attendanceCode;
    final String academicYear;
    final String semester;
    final String meeting;
    final String status;
    final String description;
    final String latitude;
    final String longitude;
    final String score;
    final String createdBy;
    final String updatedBy;
    final dynamic deletedBy;
    final DateTime createdAt;
    final DateTime updatedAt;
    final Schedule schedule;

    Attendance({
        required this.id,
        required this.scheduleId,
        required this.studentId,
        required this.attendanceCode,
        required this.academicYear,
        required this.semester,
        required this.meeting,
        required this.status,
        required this.description,
        required this.latitude,
        required this.longitude,
        required this.score,
        required this.createdBy,
        required this.updatedBy,
        required this.deletedBy,
        required this.createdAt,
        required this.updatedAt,
        required this.schedule,
    });

    factory Attendance.fromJson(String str) => Attendance.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Attendance.fromMap(Map<String, dynamic> json) => Attendance(
        id: json["id"],
        scheduleId: json["schedule_id"],
        studentId: json["student_id"],
        attendanceCode: json["attendance_code"],
        academicYear: json["academic_year"],
        semester: json["semester"],
        meeting: json["meeting"],
        status: json["status"],
        description: json["description"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        score: json["score"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        schedule: Schedule.fromMap(json["schedule"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "schedule_id": scheduleId,
        "student_id": studentId,
        "attendance_code": attendanceCode,
        "academic_year": academicYear,
        "semester": semester,
        "meeting": meeting,
        "status": status,
        "description": description,
        "latitude": latitude,
        "longitude": longitude,
        "score": score,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "schedule": schedule.toMap(),
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
    };
}
