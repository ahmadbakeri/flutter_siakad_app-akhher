import 'dart:convert';

class CreditResponseModel {
    final List<Credit> data;

    CreditResponseModel({
        required this.data,
    });

    factory CreditResponseModel.fromJson(String str) => CreditResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CreditResponseModel.fromMap(Map<String, dynamic> json) => CreditResponseModel(
        data: List<Credit>.from(json["data"].map((x) => Credit.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
    };
}

class Credit {
    final int id;
    final int subjectId;
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
    final Subject subject;

    Credit({
        required this.id,
        required this.subjectId,
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
        required this.subject,
    });

    factory Credit.fromJson(String str) => Credit.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Credit.fromMap(Map<String, dynamic> json) => Credit(
        id: json["id"],
        subjectId: json["subject_id"],
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
        subject: Subject.fromMap(json["subject"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "subject_id": subjectId,
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
        "subject": subject.toMap(),
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
    };
}
