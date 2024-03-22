import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_siakad_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_siakad_app/pages/student/student_page.dart';
import 'dart:io';
import 'bloc/credits/credits_bloc.dart';
import 'bloc/schedules/schedules_bloc.dart';
import 'pages/auth/splash_page.dart';

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
          create: (context) => CreditsBloc(),
        ),
        BlocProvider(
          create: (context) => SchedulesBloc(),
        ),
      ],
      child: MaterialApp(
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
