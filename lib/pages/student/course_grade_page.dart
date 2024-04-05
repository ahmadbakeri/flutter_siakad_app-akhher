// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../common/constants/colors.dart';
import '../../common/widgets/custom_scaffold.dart';
import 'models/course_grade_model.dart';
import 'widgets/couse_grade_tile.dart';

class CourseGradePage extends StatefulWidget {
  final String name;
  final String role;
  const CourseGradePage({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  State<CourseGradePage> createState() => _CourseGradeState();
}

class _CourseGradeState extends State<CourseGradePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const Text(
            "Nilai MK",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "14 of 64 results",
                style: TextStyle(
                  color: ColorName.grey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_list),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          CourseGradeTile(
            name: widget.name,
            role: widget.role,
            data: CourseGradeModel(
              information: '',
              attendance: 'Hadir',
              course: 'Kecerdasan Buatan',
              grade: 100,
              description: 'Tugas Praktikum',
            ),
          ),
          const SizedBox(height: 50.0),
          CourseGradeTile(
            name: widget.name,
            role: widget.role,
            data: CourseGradeModel(
              information: '',
              attendance: 'Hadir',
              course: 'Basis Data',
              grade: 80,
              description: 'Tugas Praktikum',
            ),
          ),
          const SizedBox(height: 50.0),
          CourseGradeTile(
            name: widget.name,
            role: widget.role,
            data: CourseGradeModel(
              information: '',
              attendance: 'Hadir',
              course: 'Pemrograman Dasar',
              grade: 98,
              description: 'Tugas Praktikum',
            ),
          ),
        ],
      ),
    );
  }
}
