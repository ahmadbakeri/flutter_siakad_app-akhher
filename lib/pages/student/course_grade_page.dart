// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/grades/grades_bloc.dart';
import '../../common/constants/colors.dart';
import '../../common/widgets/custom_scaffold.dart';
import '../../common/widgets/row_text.dart';

class CourseGradePage extends StatefulWidget {
  final String name;
  final String role;
  const CourseGradePage({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  State<CourseGradePage> createState() => _CourseGradePageState();
}

class _CourseGradePageState extends State<CourseGradePage> {
  @override
  void initState() {
    super.initState();
    context.read<GradesBloc>().add(const GradesEvent.getGrades());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      // padding: const EdgeInsets.all(24.0),
      // shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Text(
                  "KHS Mahasiswa",
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
                const SizedBox(height: 16.0),
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
                    widget.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    widget.role,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Divider(),
                const SizedBox(height: 16.0),
                const RowText(
                  label: 'Mata Kuliah :',
                  value: 'Nilai :',
                  labelColor: ColorName.primary,
                  valueColor: ColorName.primary,
                ),
                BlocBuilder<GradesBloc, GradesState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return const SizedBox();
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      loaded: (data) {
                        int total = 0;
                        double ipk = 0;
                        for (var element in data) {
                          total += int.parse(element.score);
                        }
                        ipk = total / data.length;
                        return Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return RowText(
                                  label: data[index].course.title,
                                  value: data[index].grade,
                                );
                              },
                            ),
                            const SizedBox(height: 26),
                            RowText(
                              label: 'IPK Semester :',
                              value: ipk.toStringAsFixed(2),
                              labelColor: ColorName.primary,
                              valueColor: ColorName.primary,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 5),
              ],
            )),
      ),
    );
  }
}
