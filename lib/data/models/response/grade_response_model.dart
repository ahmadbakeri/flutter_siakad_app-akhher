import 'dart:convert';

class GradeResponseModel {
    final List<Grade> data;

    GradeResponseModel({
        required this.data,
    });

    factory GradeResponseModel.fromJson(String str) => GradeResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GradeResponseModel.fromMap(Map<String, dynamic> json) => GradeResponseModel(
        data: List<Grade>.from(json["data"].map((x) => Grade.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Grade {
    final int id;
    final int courseId;
    final int studentId;
    final String score;
    final String grade;
    final String description;
    final String academicYear;
    final String semester;
    final String createdBy;
    final String updatedBy;
    final dynamic deletedBy;
    final DateTime createdAt;
    final DateTime updatedAt;
    final Course course;

    Grade({
        required this.id,
        required this.courseId,
        required this.studentId,
        required this.score,
        required this.grade,
        required this.description,
        required this.academicYear,
        required this.semester,
        required this.createdBy,
        required this.updatedBy,
        required this.deletedBy,
        required this.createdAt,
        required this.updatedAt,
        required this.course,
    });

    factory Grade.fromJson(String str) => Grade.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Grade.fromMap(Map<String, dynamic> json) => Grade(
        id: json["id"],
        courseId: json["course_id"],
        studentId: json["student_id"],
        score: json["score"],
        grade: json["grade"],
        description: json["description"],
        academicYear: json["academic_year"],
        semester: json["semester"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        course: Course.fromMap(json["course"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "course_id": courseId,
        "student_id": studentId,
        "score": score,
        "grade": grade,
        "description": description,
        "academic_year": academicYear,
        "semester": semester,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "course": course.toMap(),
    };
}

class Course {
    final int id;
    final String title;
    final String subtitle;
    final String courseClass;
    final String time;
    final String image;
    final DateTime createdAt;
    final DateTime updatedAt;

    Course({
        required this.id,
        required this.title,
        required this.subtitle,
        required this.courseClass,
        required this.time,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Course.fromJson(String str) => Course.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Course.fromMap(Map<String, dynamic> json) => Course(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        courseClass: json["class"],
        time: json["time"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "class": courseClass,
        "time": time,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
