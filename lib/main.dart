import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'bloc/attendances/attendances_bloc.dart';
import 'bloc/grades/grades_bloc.dart';
import 'bloc/toplists/toplists_bloc.dart';
import 'bloc/courses/courses_bloc.dart';
import 'bloc/schedules/schedules_bloc.dart';
import 'bloc/users/users_bloc.dart';
import 'data/datasources/auth_local_datasource.dart';
import 'pages/auth/splash_page.dart';
import 'pages/student/student_page.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GradesBloc(),
        ),
        BlocProvider(
          create: (context) => SchedulesBloc(),
        ),
        BlocProvider(
          create: (context) => ToplistsBloc(),
        ),
        BlocProvider(
          create: (context) => CoursesBloc(),
        ),
        BlocProvider(
          create: (context) => UsersBloc(),
        ),
        BlocProvider(
          create: (context) => AttendancesBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder<bool>(
          future: AuthLocalDatasource().isLogin(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!) {
              return const StudentPage();
            } else {
              return const SplashPage();
            }
          },
        ),
      ),
    );
  }
}
