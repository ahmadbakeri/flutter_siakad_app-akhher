import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/users/users_bloc.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/images.dart';
import '../../common/widgets/menu_card.dart';
import 'course_grade_page.dart';
import 'course_schedule_page.dart';
import 'credit_hours_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    context.read<UsersBloc>().add(const UsersEvent.getUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        title: const Text(
          "Perkuliahan",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: ColorName.primary,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(child: CircularProgressIndicator());
            },
            loaded: (user) {
              // Access user data here
              // Assuming 'name' is the property for the user's name
              // String userName = user.name;
              return ListView(
                padding: const EdgeInsets.all(20.0),
                children: [
                  MenuCard(
                    label: 'Kartu Hasil\nStudi',
                    backgroundColor: const Color(0xff686BFF),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreditHoursPage(
                              name: user.name,
                              role: user.roles,
                            ),
                          ));
                    },
                    imagePath: Images.khs,
                  ),
                  const SizedBox(height: 40.0),
                  MenuCard(
                    label: 'Nilai\nMata Kuliah',
                    backgroundColor: const Color(0xffFFB023),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseGradePage(
                              name: user.name,
                              role: user.roles,
                            ),
                          ));
                    },
                    imagePath: Images.nMatkul,
                  ),
                  const SizedBox(height: 40.0),
                  MenuCard(
                    label: 'Jadwal\nMata Kuliah',
                    backgroundColor: const Color(0xffFF68F0),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CourseSchedulePage(),
                          ));
                    },
                    imagePath: Images.jadwal,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
