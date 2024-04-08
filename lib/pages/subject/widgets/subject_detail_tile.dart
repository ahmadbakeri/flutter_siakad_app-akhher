// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../common/constants/colors.dart';
import '../../../common/widgets/row_text.dart';
import '../../student/models/course_grade_model.dart';

class CourseGradeTile extends StatelessWidget {
  final String name;
  final String role;
  final CourseGradeModel data;
  const CourseGradeTile({
    super.key,
    required this.name,
    required this.role,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            child: Image.network(
              'https://avatars.githubusercontent.com/u/147062436',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            role,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        RowText(
          label: 'Absensi',
          value: '',
          valueColor: ColorName.primary,
          valueWidget: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              color: ColorName.lightGreen,
            ),
            child: Text(
              data.attendance,
              style: const TextStyle(
                color: ColorName.green,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
        const SizedBox(height: 14.0),
        RowText(
          label: data.course,
          value: data.grade.toString(),
        ),
        const SizedBox(height: 12.0),
        RowText(
          label: 'Keterangan',
          value: data.description,
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}